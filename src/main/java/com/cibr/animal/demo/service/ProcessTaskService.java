package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.*;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.EmailUtil;
import com.cibr.animal.demo.util.TaskUtil;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.rmi.PortableRemoteObject;
import java.util.*;

@Service
public class ProcessTaskService {

    @Autowired
    private CibrSysTaskMapper cibrSysTaskMapper;

    @Autowired
    private CibrTaskProcessMapper processMapper;

    @Autowired
    private CibrTaskProcessEmailMapper processEmailMapper;

    @Autowired
    private CibrSysTaskBusinessMapper businessMapper;

    @Autowired
    private EmailService emailService;

    @Autowired
    private CibrSysUserService userService;

    @Autowired
    private CibrTaskProcessSampleinputMapper sampleinputMapper;

    @Autowired
    private CibrTaskProcessSamplemakeMapper makeMapper;

    @Autowired
    private CibrTaskProcessLibraryMapper libraryMapper;

    @Autowired
    private CibrTaskProcessDismountdataMapper dismountdataMapper;

    @Autowired
    private CibrTaskProcessAnalysisMapper analysisMapper;

    @Transactional(rollbackFor = Exception.class)
    public void createProcessTask(CibrSysUser user, String projectName, String dataType, String principal, List<String> emails, String sampleMsg, String samplePreparation, String libraryPreparation, String dismountData, String bioinformaticsAnalysis, String remarks) {
        /*任务主表*/
        CibrSysTask task = new CibrSysTask();
        String taskId = Util.getUUID();
        task.setId(taskId);
        task.setTaskstatu(TaskUtil.TASK_STATU_TODO);
        task.setCurrentuser(samplePreparation);
        task.setCreatetime(new Date());
        task.setCreateuser(user.getId());
        task.setTasktype(TaskUtil.PROCESS_TASK);
        task.setTaskdesc(remarks);
        cibrSysTaskMapper.insert(task);
        /*流程任务表*/
        CibrTaskProcess process = new CibrTaskProcess();
        String processId = Util.getUUID();
        process.setId(processId);
        process.setTaskid(taskId);
        process.setCreater(user.getId());
        process.setCreatetime(new Date());
        process.setProjectname(projectName);
        process.setDatatype(dataType);
        process.setPrincipal(principal);
        process.setSampletype(sampleMsg);
        process.setSamplepreparation(samplePreparation);
        process.setLibrarypreparation(libraryPreparation);
        process.setDismountdata(dismountData);
        process.setBioinformaticsanalysis(bioinformaticsAnalysis);
        process.setRemarks(remarks);
        process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_SP);
        processMapper.insert(process);

        List<CibrTaskProcessEmail> list = new ArrayList<CibrTaskProcessEmail>();
        for (String email : emails){
            CibrTaskProcessEmail processEmail = new CibrTaskProcessEmail();
            processEmail.setProcessid(processId);
            processEmail.setEmail(email);
            list.add(processEmail);
        }
        processEmailMapper.batchInsert(list);

        CibrSysTaskBusiness business = new CibrSysTaskBusiness();
        business.setTaskid(taskId);
        business.setPrestatu(TaskUtil.TASK_STATU_TODO);
        business.setNextstatu(TaskUtil.TASK_STATU_TODO);
        business.setId(Util.getUUID());
        business.setCreatetime(new Date());
        business.setUserid(user.getId());
        business.setBusiness("创建流程管理任务");
        businessMapper.insert(business);

        List<String> userIds = new ArrayList<String>();
        userIds.add(samplePreparation);
        userIds.add(libraryPreparation);
        userIds.add(dismountData);
        userIds.add(bioinformaticsAnalysis);
        List<CibrSysUser> users = userService.findUserByIds(userIds);
        List<String> addrs = new ArrayList<String>();
        for (CibrSysUser cibrSysUser : users){
            addrs.add(cibrSysUser.getEmail());
        }
        StringBuilder sb = new StringBuilder(Util.EMAIL_PREFIX);
        sb.append("您有一个【" + TaskUtil.TASK_PROCESS + "】待处理，请及时查看！");
        sb.append("\n如有疑问，请联系【");
        sb.append(user.getEmail());
        sb.append("】");
        sb.append(Util.EMAIL_SUFFIX);
        emailService.simpleSendEmail(sb.toString(),addrs,TaskUtil.TASK_PROCESS);
    }

    public List<CibrTaskProcess> findAllPorcess(){
        List<CibrTaskProcess> cibrTaskProcesses = processMapper.queryAllProcess(new HashMap());
        return cibrTaskProcesses;
    }

    public CibrTaskProcess getPorcessById(String processId) {
        Map<String,String> condition = new HashMap<>();
        condition.put("id",processId);
        List<CibrTaskProcess> cibrTaskProcesses = processMapper.queryAllProcess(condition);
        return cibrTaskProcesses.get(0);
    }

    public CibrTaskProcess getProcessByTaskId(String taskId){
        CibrSysTask task = cibrSysTaskMapper.selectByPrimaryKey(taskId);
        if (!"03".equals(task.getTasktype())){
            return null;
        }
        CibrTaskProcessExample processExample = new CibrTaskProcessExample();
        processExample.createCriteria().andTaskidEqualTo(taskId);
        List<CibrTaskProcess> cibrTaskProcesses = processMapper.selectByExample(processExample);
        return getPorcessById(cibrTaskProcesses.get(0).getId());
    }

    public void batchInsert(List<CibrTaskProcessSampleinput> list){
        sampleinputMapper.batchInsert(list);
    }

    public List<CibrTaskProcessSampleinput> getSampleInputs(String processId) {
        CibrTaskProcessSampleinputExample sampleinputExample = new CibrTaskProcessSampleinputExample();
        sampleinputExample.createCriteria().andProcessidEqualTo(processId).andCurrentstatuNotEqualTo("09");
        sampleinputExample.setOrderByClause("rowIndex");
        return sampleinputMapper.selectByExample(sampleinputExample);
    }

    /**
     * 样品录入已完成，保存最终样品录入结果
     * @param processId
     * @param user
     * @param list
     */
    @Transactional(rollbackFor = Exception.class)
    public void saveSampleInput(String processId, CibrSysUser user, List<CibrTaskProcessSampleinput> list,String type) {
        CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
        CibrTaskProcessSampleinputExample example = new CibrTaskProcessSampleinputExample();
        example.createCriteria().andProcessidEqualTo(processId);
        final List<CibrTaskProcessSampleinput> list_database = sampleinputMapper.selectByExample(example);

        List<CibrTaskProcessSampleinput> updateList = new ArrayList<CibrTaskProcessSampleinput>();
        List<CibrTaskProcessSampleinput> delList = new ArrayList<CibrTaskProcessSampleinput>();
        List<CibrTaskProcessSampleinput> insertList = new ArrayList<CibrTaskProcessSampleinput>();
        Map<String,CibrTaskProcessSampleinput> update_map = new HashMap<>();
        for (CibrTaskProcessSampleinput input : list){
            if ("real".equals(type)){
                input.setCurrentstatu("02");
            }else {
                input.setCurrentstatu("01");
            }
            if (StringUtils.isEmpty(input.getId())){
                input.setId(Util.getUUID());
                input.setCreater(user.getId());
                input.setProcessid(processId);
                input.setCreatetime(new Date());
                insertList.add(input);
            }else {
                updateList.add(input);
                update_map.put(input.getId(),input);
            }
        }

        int maxRowIndex = -1;
        for (CibrTaskProcessSampleinput input : list_database){
            if (maxRowIndex < input.getRowindex()){
                maxRowIndex = input.getRowindex();
            }
            if (update_map.get(input.getId()) == null){
                input.setCurrentstatu("09");
                delList.add(input);
            }
        }
        for (CibrTaskProcessSampleinput input : insertList){
            maxRowIndex ++;
            input.setRowindex(maxRowIndex);
        }

        if ("real".equals(type)){
            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_SPWAIT);
            process.setInputtime(new Date());
            processMapper.updateByPrimaryKey(process);
            /*创建样本制备信息*/
            List<CibrTaskProcessSamplemake> makes = createMakes(list);
            makeMapper.batchInsert(makes);
        }
        if (insertList.size()>0){
            sampleinputMapper.batchInsert(insertList);
        }
        if (updateList.size()>0){
            sampleinputMapper.batchUpdate(updateList);
        }
        if (delList.size()>0){
            sampleinputMapper.batchUpdate(delList);
        }
    }

    public List<CibrTaskProcessSamplemake> createMakes(List<CibrTaskProcessSampleinput> sampleInputs){
        List<CibrTaskProcessSamplemake> samplemakes = new ArrayList<CibrTaskProcessSamplemake>();
        for(CibrTaskProcessSampleinput sampleinput : sampleInputs){
            CibrTaskProcessSamplemake make = new CibrTaskProcessSamplemake();
            make.setId(Util.getUUID());
            make.setProcessid(sampleinput.getProcessid());
            make.setInputid(sampleinput.getId());
            make.setSamplename(sampleinput.getSamplename());
            make.setSpecies(sampleinput.getSpecies());
            make.setTissue(sampleinput.getTissue());
            make.setConcentration(sampleinput.getConcentration());
            make.setSamplevolume(sampleinput.getSamplevolume());
            make.setTotalnumber(sampleinput.getTotalnumber());
            make.setCelllife(sampleinput.getCelllife());
            make.setCellsort(sampleinput.getCellsort());
            make.setDatabasetype(sampleinput.getDatabasetype());
            make.setSequencingplatform(sampleinput.getSequencingplatform());
            make.setSelfnumber("");
            make.setTestdate(new Date());
            make.setCheckresult("");
            make.setCheckremarks("");
            make.setCheckuser("");
            make.setReviewer("");
            make.setRemaining("");
            make.setRemarks("");
            make.setCurrentstatu("00");
            make.setRowindex(sampleinput.getRowindex());
            samplemakes.add(make);
        }
        return samplemakes;
    }

    public List<CibrTaskProcessSamplemake> getAllTodoMakes(String processId) {
        CibrTaskProcessSamplemakeExample samplemakeExample = new CibrTaskProcessSamplemakeExample();
        samplemakeExample.createCriteria().andProcessidEqualTo(processId);
        samplemakeExample.setOrderByClause("rowIndex desc");
        return makeMapper.selectByExample(samplemakeExample);
    }

    /**
     * 暂存或保存样本制备信息
     * @param processId
     * @param flag
     * @param list
     * @param user
     */
    @Transactional(rollbackFor = Exception.class)
    public void saveSampleMakes(String processId, String flag, List<CibrTaskProcessSamplemake> list, CibrSysUser user) {
        List<CibrTaskProcessLibrary> libs = new ArrayList<CibrTaskProcessLibrary>();
        for (CibrTaskProcessSamplemake make : list){
            make.setProcessid(processId);
            if("tmp".equals(flag)){
                make.setCreater(user.getId());
                make.setCreatetime(new Date());
                make.setCurrentstatu("01");
            }else {
                make.setConfirmer(user.getId());
                make.setConfirmtime(new Date());
                make.setCurrentstatu("02");
                CibrTaskProcessLibrary lib = createLib(make);
                libs.add(lib);
            }
        }
        makeMapper.batchUpdate(list);
        if ("real".equals(flag)){
            CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
            process.setSpupdatetime(new Date());
            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_LIB);
            processMapper.updateByPrimaryKey(process);
            /*创建文库信息*/
            libraryMapper.batchInsert(libs);
        }
    }

    public CibrTaskProcessLibrary createLib(CibrTaskProcessSamplemake make){
        CibrTaskProcessLibrary lib = new CibrTaskProcessLibrary();
        lib.setId(Util.getUUID());
        lib.setSelfnumber(make.getSelfnumber());
        lib.setProcessid(make.getProcessid());
        lib.setRowindex(make.getRowindex());
        lib.setCelllife(make.getCelllife());
        lib.setSpecies(make.getSpecies());
        lib.setSamplename(make.getSamplename());
        lib.setConcentration(make.getConcentration());
        lib.setTotalnumber(make.getTotalnumber());
        lib.setCurrentstatu("00");
        return lib;
    }

    public List<CibrTaskProcessLibrary> selectAllLibs(String processId) {
        CibrTaskProcessLibraryExample example = new CibrTaskProcessLibraryExample();
        example.createCriteria().andProcessidEqualTo(processId);
        example.setOrderByClause("rowIndex desc");
        return libraryMapper.selectByExample(example);
    }

    @Transactional(rollbackFor = Exception.class)
    public void tempSaveLibs(String processId, List<CibrTaskProcessLibrary> libs,String type, CibrSysUser user) {
        List<CibrTaskProcessDismountdata> list = new ArrayList<>();
        for (CibrTaskProcessLibrary lib : libs){
            if ("tmp".equals(type)){
                lib.setCreateuser(user.getId());
                lib.setCreatetime(new Date());
                lib.setCurrentstatu("01");
            }else {
                lib.setCreateuser(user.getId());
                lib.setCreatetime(new Date());
                lib.setCurrentstatu("02");
                list.add(createDismountData(user,lib,processId));
            }
        }
        libraryMapper.batchUpdate(libs);
        if ("real".equals(type)){
            CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_DIS);
            process.setLpupdatetime(new Date());
            processMapper.updateByPrimaryKey(process);
            dismountdataMapper.batchInsert(list);
        }
    }

    private CibrTaskProcessDismountdata createDismountData(CibrSysUser user, CibrTaskProcessLibrary lib, String processId) {
        CibrTaskProcessDismountdata dismountdata = new CibrTaskProcessDismountdata();
        dismountdata.setId(Util.getUUID());
        dismountdata.setProcessid(processId);
        dismountdata.setMakeid(lib.getId());
        dismountdata.setCreater(user.getId());
        dismountdata.setCreatetime(new Date());
        dismountdata.setCurrentstatu("00");
        dismountdata.setRowindex(lib.getRowindex());
        dismountdata.setSampleindex(lib.getSelfnumber());
        dismountdata.setSamplename(lib.getSamplename());
        return dismountdata;
    }

    public List<CibrTaskProcessDismountdata> selectAllDismountDatas(String processId) {
        CibrTaskProcessDismountdataExample example = new CibrTaskProcessDismountdataExample();
        example.createCriteria().andProcessidEqualTo(processId);
        example.setOrderByClause("rowIndex desc");
        return dismountdataMapper.selectByExample(example);
    }

    @Transactional(rollbackFor = Exception.class)
    public void saveDismountData(String processId, List<CibrTaskProcessDismountdata> dismountdatas, String type, CibrSysUser user) {
        List<CibrTaskProcessAnalysis> analyses = new ArrayList<>();
        for (CibrTaskProcessDismountdata dismountdata : dismountdatas){
            if ("tmp".equals(type)){
                dismountdata.setCurrentstatu("01");
            }else {
                dismountdata.setCurrentstatu("02");
                dismountdata.setCreatetime(new Date());
                dismountdata.setCreater(user.getId());
                analyses.add(createAnalyse(dismountdata,processId,user));
            }
        }
        dismountdataMapper.batchUpdate(dismountdatas);
        if ("real".equals(type)){
            CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
            process.setDdupdatetime(new Date());
            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_BA);
            analysisMapper.batchInsert(analyses);
            processMapper.updateByPrimaryKey(process);
        }
    }

    private CibrTaskProcessAnalysis createAnalyse(CibrTaskProcessDismountdata dismountdata, String processId, CibrSysUser user) {
        CibrTaskProcessAnalysis analysis = new CibrTaskProcessAnalysis();
        analysis.setId(Util.getUUID());
        analysis.setCreater(user.getId());
        analysis.setCreatetime(new Date());
        analysis.setProcessid(processId);
        analysis.setDismountid(dismountdata.getId());
        analysis.setSamplename(dismountdata.getSamplename());
        analysis.setSampleindex(dismountdata.getSampleindex());
        analysis.setCurrentstatu("00");
        return analysis;
    }

    public List<CibrTaskProcessAnalysis> selectAllAnalyses(String processId) {
        CibrTaskProcessAnalysisExample analysisExample = new CibrTaskProcessAnalysisExample();
        analysisExample.createCriteria().andProcessidEqualTo(processId);
        analysisExample.setOrderByClause("rowIndex desc");
        return analysisMapper.selectByExample(analysisExample);
    }

    public void saveAnalyses(String processId, List<CibrTaskProcessAnalysis> analyses, String type, CibrSysUser user) {
        for (CibrTaskProcessAnalysis analysis : analyses){
            if ("tmp".equals(type)){
                analysis.setCurrentstatu("01");
            }else {
                analysis.setCurrentstatu("02");
            }
            analysis.setCreater(user.getId());
            analysis.setCreatetime(new Date());
        }
        analysisMapper.batchUpdate(analyses);
        if ("real".equals(type)){
            CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
            process.setBaupdatetime(new Date());
            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_READY);
            processMapper.updateByPrimaryKey(process);
        }
    }
}
























