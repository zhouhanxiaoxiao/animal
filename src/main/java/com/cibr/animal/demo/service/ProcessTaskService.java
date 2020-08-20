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

import java.util.*;

@Service
public class ProcessTaskService {

    @Autowired
    private CibrSysTaskMapper taskMapper;

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
        taskMapper.insert(task);
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
        CibrSysTask task = taskMapper.selectByPrimaryKey(taskId);
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
    public void saveSampleInput(String processId, CibrSysUser user, List<CibrTaskProcessSampleinput> list) {
        CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
        process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_SPWAIT);
        process.setInputtime(new Date());
        processMapper.updateByPrimaryKey(process);

        CibrTaskProcessSampleinputExample example = new CibrTaskProcessSampleinputExample();
        example.createCriteria().andProcessidEqualTo(processId);
        final List<CibrTaskProcessSampleinput> list_database = sampleinputMapper.selectByExample(example);

        List<CibrTaskProcessSampleinput> updateList = new ArrayList<CibrTaskProcessSampleinput>();
        List<CibrTaskProcessSampleinput> delList = new ArrayList<CibrTaskProcessSampleinput>();
        List<CibrTaskProcessSampleinput> insertList = new ArrayList<CibrTaskProcessSampleinput>();
        Map<String,CibrTaskProcessSampleinput> update_map = new HashMap<>();
        for (CibrTaskProcessSampleinput input : list){
            input.setCurrentstatu("02");
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

    public List<CibrTaskProcessSamplemake> getAllTodoMakes(String processId) {
        List<CibrTaskProcessSampleinput> sampleInputs = this.getSampleInputs(processId);
        List<CibrTaskProcessSamplemake> samplemakes = new ArrayList<CibrTaskProcessSamplemake>();
        for(CibrTaskProcessSampleinput sampleinput : sampleInputs){
            CibrTaskProcessSamplemake make = new CibrTaskProcessSamplemake();
            make.setProcessid(processId);
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
            samplemakes.add(make);
        }
        return samplemakes;
    }
}
























