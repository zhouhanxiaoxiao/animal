package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.*;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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


    @Autowired
    private CibrTaskProcessSubtaskMapper subtaskMapper;

    @Autowired
    private CibrSysSampleindexMapper sampleindexMapper;

    @Autowired
    private FileService fileService;

    @Autowired
    private CibrTaskFailMapper failMapper;

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
            make.setSelfnumber(sampleinput.getSampleindex());
            make.setInitsample(sampleinput.getInitsample());
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

    public List<CibrTaskProcessSamplemake> getAllTodoMakes(String processId,String subId) {
        CibrTaskProcessSamplemakeExample samplemakeExample = new CibrTaskProcessSamplemakeExample();
        samplemakeExample.createCriteria().andProcessidEqualTo(processId).andSubidEqualTo(subId);
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
            if ("09".equals(make.getCurrentstatu())){
                continue;
            }
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


    @Transactional(rollbackFor = Exception.class)
    public void startSubTask(String processId, List<CibrTaskProcessSampleinput> list,String subName,String remarks, CibrSysUser user) {

        CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
        CibrTaskProcessSampleinputExample sampleinputExample = new CibrTaskProcessSampleinputExample();
        sampleinputExample.createCriteria().andProcessidEqualTo(processId);
        List<CibrTaskProcessSampleinput> databaseInputs = sampleinputMapper.selectByExample(sampleinputExample);
        Map<String, List<CibrTaskProcessSampleinput>> divide = getDivide(databaseInputs, list,user);
        List<CibrTaskProcessSampleinput> saveList = divide.get("saveList");
        List<CibrTaskProcessSampleinput> updateList = divide.get("updateList");

        if (updateList.size()>0){
            sampleinputMapper.batchUpdate(updateList);
        }
        if (saveList.size()>0){
            sampleinputMapper.batchInsert(saveList);
        }

        CibrTaskProcessSubtask subtask = new CibrTaskProcessSubtask();
        subtask.setId(Util.getUUID());
        subtask.setCreater(user.getId());
        subtask.setCreatetime(new Date());
        subtask.setCurrentstatu(TaskUtil.PROCESS_TASK_STATU_SPWAIT);
        subtask.setName(subName);
        subtask.setProcessid(processId);
        subtask.setTaskid(process.getTaskid());
        subtask.setRemarks(remarks);
        subtaskMapper.insert(subtask);

        List<CibrTaskProcessSamplemake> makes = createMakes(list);
        for (CibrTaskProcessSamplemake make : makes) {
            make.setSubid(subtask.getId());
        }

        makeMapper.batchInsert(makes);

    }

    /**
     * 区分是新增的input，还是原有的input,
     * 如果是新增的，则给input编号
     * @param databaseInputs
     * @param commitInputs
     * @return
     */
    public Map<String,List<CibrTaskProcessSampleinput>> getDivide(List<CibrTaskProcessSampleinput> databaseInputs,
                                                                  List<CibrTaskProcessSampleinput> commitInputs,
                                                                  CibrSysUser user
    ){
        Map<String,List<CibrTaskProcessSampleinput>> retMap = new HashMap<>();
        List<CibrTaskProcessSampleinput> saveList = new ArrayList<>();
        List<CibrTaskProcessSampleinput> updateList = new ArrayList<>();
        for (CibrTaskProcessSampleinput commit : commitInputs){
            if (StringUtils.isEmpty(commit.getRowindex())){
                saveList.add(commit);
            }else {
                updateList.add(commit);
            }
        }
        int rowIndex = -1;
        for (CibrTaskProcessSampleinput ip : databaseInputs){
            if (ip.getRowindex() > rowIndex){
                rowIndex = ip.getRowindex();
            }
        }
        for (CibrTaskProcessSampleinput ip : saveList){
            ip.setId(Util.getUUID());
            ip.setCreatetime(new Date());
            ip.setCreater(user.getId());
            rowIndex ++;
            ip.setRowindex(rowIndex);
        }
        retMap.put("saveList",saveList);
        retMap.put("updateList",updateList);
        return retMap;
    }

    public List<CibrTaskProcessSubtask> getAllSubTask(String processId) {
        CibrTaskProcessSubtaskExample subtaskExample = new CibrTaskProcessSubtaskExample();
        subtaskExample.createCriteria().andProcessidEqualTo(processId);
        subtaskExample.setOrderByClause("createTime desc");
        return subtaskMapper.selectByExample(subtaskExample);
    }

    public Map<String ,Object> getProcessBySubTaskId(String subId) {
        CibrTaskProcessSubtask subtask = subtaskMapper.selectByPrimaryKey(subId);
        CibrTaskProcess process = processMapper.selectByPrimaryKey(subtask.getProcessid());
        Map<String ,Object> retMap = new HashMap<>();
        retMap.put("process",process);
        retMap.put("subTask", subtask);
        return retMap;
    }

    /**
     * 获取当前月份的编号
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Map<String,CibrSysSampleindex> getCurrentIndex(){
        Map<String,CibrSysSampleindex> retMap = new HashMap<>();
        String yyMM = TimeUtil.date2str(new Date(),"yyMM");
        CibrSysSampleindexExample sampleindexExample = new CibrSysSampleindexExample();
        sampleindexExample.createCriteria().andCurtimeEqualTo(yyMM);
        List<CibrSysSampleindex> sampleindexs = sampleindexMapper.selectByExample(sampleindexExample);
        if (sampleindexs == null || sampleindexs.size() == 0){
            CibrSysSampleindex ND = new CibrSysSampleindex();
            ND.setName("ND");
            ND.setCurtime(yyMM);
            ND.setCurrentindex(0);
            sampleindexMapper.insert(ND);
            CibrSysSampleindex NR = new CibrSysSampleindex();
            NR.setName("NR");
            NR.setCurtime(yyMM);
            NR.setCurrentindex(0);
            sampleindexMapper.insert(NR);
            CibrSysSampleindex NC = new CibrSysSampleindex();
            NC.setName("NC");
            NC.setCurtime(yyMM);
            NC.setCurrentindex(0);
            sampleindexMapper.insert(NC);
            CibrSysSampleindex NDO = new CibrSysSampleindex();
            NDO.setName("NDO");
            NDO.setCurtime(yyMM);
            NDO.setCurrentindex(0);
            sampleindexMapper.insert(NDO);
            CibrSysSampleindex NRO = new CibrSysSampleindex();
            NRO.setName("NRO");
            NRO.setCurtime(yyMM);
            NRO.setCurrentindex(0);
            sampleindexMapper.insert(NRO);
            CibrSysSampleindex ZND = new CibrSysSampleindex();
            ZND.setName("ZND");
            ZND.setCurtime(yyMM);
            ZND.setCurrentindex(0);
            sampleindexMapper.insert(ZND);
            CibrSysSampleindex ZNR = new CibrSysSampleindex();
            ZNR.setName("ZNR");
            ZNR.setCurtime(yyMM);
            ZNR.setCurrentindex(0);
            sampleindexMapper.insert(ZNR);
            CibrSysSampleindex ZNC = new CibrSysSampleindex();
            ZNC.setName("ZNC");
            ZNC.setCurtime(yyMM);
            ZNC.setCurrentindex(0);
            sampleindexMapper.insert(ZNC);
            retMap.put("ND",ND);
            retMap.put("NR",NR);
            retMap.put("NC",NC);
            retMap.put("NDO",NDO);
            retMap.put("NRO",NRO);
            retMap.put("ZND",ZND);
            retMap.put("ZNR",ZNR);
            retMap.put("ZNC",ZNC);
        }else {
            for (CibrSysSampleindex sampleindex : sampleindexs){
                retMap.put(sampleindex.getName(),sampleindex);
            }
        }
        return retMap;
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateSampleIndex(Map<String, CibrSysSampleindex> currentIndexs) {
        for (String cur : currentIndexs.keySet()){
            sampleindexMapper.updateByPrimaryKey(currentIndexs.get(cur));
        }
    }

    public HSSFWorkbook downloadSampleInput(String processId,CibrSysUser user) {
        CibrTaskProcessSampleinputExample sampleinputExample = new CibrTaskProcessSampleinputExample();
        sampleinputExample.createCriteria().andProcessidEqualTo(processId);
        sampleinputExample.setOrderByClause("rowIndex");
        List<CibrTaskProcessSampleinput> list = sampleinputMapper.selectByExample(sampleinputExample);

        List<List<String>> excleRows = new ArrayList<>();
        List<String> heads = new ArrayList<>();
        heads.add("批次");
        heads.add("初始样本");
        heads.add("样本名称");
        heads.add("样本编号");
        heads.add("物种");
        heads.add("组织来源");
        heads.add("样本类型");
        heads.add("样本状态");
        heads.add("组织量（g）");
        heads.add("血液体积(ml)");
        heads.add("浓度(细胞个数/μl)");
        heads.add("样本体积(ul)");
        heads.add("细胞总量(细胞个数)");
        heads.add("细胞活性");
        heads.add("细胞分选法");
        heads.add("建库类型");
        heads.add("测序平台");
        heads.add("备注");
        excleRows.add(heads);
        for (CibrTaskProcessSampleinput input : list){
            List<String> row = new ArrayList<>();
            row.add(Util.nullToStr(input.getArrindex()));
            row.add(Util.nullToStr(FileUtil.getInitSampleFlag(input.getInitsample())));
            row.add(Util.nullToStr(input.getSamplename()));
            row.add(Util.nullToStr(input.getSampleindex()));
            row.add(Util.nullToStr(input.getSpecies()));
            row.add(Util.nullToStr(input.getTissue()));
            row.add(Util.nullToStr(FileUtil.getSampleTypeFlag(input.getSamplemsg())));
            row.add(Util.nullToStr(FileUtil.getSampleStatuFlag(input.getSamplestatu())));
            row.add(Util.nullToStr(input.getTissuenumber()));
            row.add(Util.nullToStr(input.getBloodvolume()));
            row.add(Util.nullToStr(input.getConcentration()));
            row.add(Util.nullToStr(input.getSamplevolume()));
            row.add(Util.nullToStr(input.getTotalnumber()));
            row.add(Util.nullToStr(input.getCelllife()));
            row.add(Util.nullToStr(FileUtil.getCellsortFlag(input.getCellsort())));
            row.add(Util.nullToStr(FileUtil.getDatabaseFlag(input.getDatabasetype())));
            row.add(Util.nullToStr(FileUtil.getSeqFlag(input.getSequencingplatform())));
            row.add(Util.nullToStr(input.getRemarks()));
            excleRows.add(row);
        }
        HSSFWorkbook sheets = fileService.exportExcel(excleRows, user);
        return sheets;
    }

    /**
     * 停止样本制备过程
     * @param makeId
     * @param reason
     * @param remark
     * @param user
     */
    @Transactional(rollbackFor = Exception.class)
    public void stopMake(String makeId, String reason, String remark, CibrSysUser user) {
        CibrTaskProcessSamplemake make = makeMapper.selectByPrimaryKey(makeId);
        make.setCurrentstatu("09");
        makeMapper.updateByPrimaryKey(make);

        CibrTaskFail fail = new CibrTaskFail();
        fail.setId(Util.getUUID());
        fail.setDetailid(make.getId());
        fail.setHandler(user.getId());
        fail.setCreatetime(new Date());
        fail.setReason(reason);
        fail.setRemarks(remark);
        failMapper.insert(fail);
    }

    public String showStopReason(String detailId) {
        CibrTaskFailExample failExample = new CibrTaskFailExample();
        failExample.createCriteria().andDetailidEqualTo(detailId);
        failExample.setOrderByClause("createTime");
        List<CibrTaskFail> fails = failMapper.selectByExample(failExample);
        if (fails == null || fails.size() == 0){
            return "";
        }else {
            return fails.get(0).getReason();
        }

    }

    public HSSFWorkbook downloadMakes(String subId,CibrSysUser user) {
        CibrTaskProcessSamplemakeExample samplemakeExample = new CibrTaskProcessSamplemakeExample();
        samplemakeExample.createCriteria().andSubidEqualTo(subId);
        samplemakeExample.setOrderByClause("rowIndex");
        List<CibrTaskProcessSamplemake> samplemakes = makeMapper.selectByExample(samplemakeExample);
        Map<String, String> uuid_user = userService.getid_user();

        List<List<String>> excleRows = new ArrayList<>();
        List<String> heads = new ArrayList<>();
        heads.add("初始样本");
        heads.add("样本名称");
        heads.add("样本编号");
        heads.add("样本衍生编号");
        heads.add("物种");
        heads.add("组织来源");
        heads.add("检测日期");
        heads.add("浓度(细胞个数/μl)");
        heads.add("样本体积(ul)");
        heads.add("细胞总量(细胞个数)");
        heads.add("细胞活性");
        heads.add("细胞分选法");
        heads.add("提取方法");
        heads.add("检测结果");
        heads.add("检测备注");
        heads.add("检测员");
        heads.add("审核人");
        heads.add("建库类型");
        heads.add("测序平台");
        heads.add("剩余量");
        heads.add("备注");
        excleRows.add(heads);
        for (CibrTaskProcessSamplemake make : samplemakes){
            List<String> row = new ArrayList<>();
            row.add(Util.nullToStr(FileUtil.getInitSampleFlag(make.getInitsample())));
            row.add(Util.nullToStr(make.getSamplename()));
            row.add(Util.nullToStr(make.getSelfnumber()));
            row.add(Util.nullToStr(make.getDerivativeindex()));
            row.add(Util.nullToStr(make.getSpecies()));
            row.add(Util.nullToStr(make.getTissue()));
            row.add(Util.nullToStr(TimeUtil.date2str(make.getTestdate(),"yyyy-MM-dd")));
            row.add(Util.nullToStr(make.getConcentration()));
            row.add(Util.nullToStr(make.getSamplevolume()));
            row.add(Util.nullToStr(make.getTotalnumber()));
            row.add(Util.nullToStr(make.getCelllife()));
            row.add(Util.nullToStr(FileUtil.getCellsortFlag(make.getCellsort())));
            row.add(Util.nullToStr(FileUtil.getExtractFlag(make.getExtractmethod())));
            row.add(Util.nullToStr(FileUtil.getCheckResultFlag(make.getCheckresult())));
            row.add(Util.nullToStr(make.getCheckremarks()));
            row.add(Util.nullToStr(uuid_user.get(make.getCheckuser())));
            row.add(Util.nullToStr(uuid_user.get(make.getReviewer())));
            row.add(Util.nullToStr(FileUtil.getDatabaseFlag(make.getDatabasetype())));
            row.add(Util.nullToStr(FileUtil.getSeqFlag(make.getSequencingplatform())));
            row.add(Util.nullToStr(make.getRemaining()));
            row.add(Util.nullToStr(make.getRemarks()));
            excleRows.add(row);
        }
        HSSFWorkbook sheets = fileService.exportExcel(excleRows, user);
        return sheets;
    }

    public CibrTaskProcessSubtask selectSubTaskById(String subId) {
        return subtaskMapper.selectByPrimaryKey(subId);
    }
}
























