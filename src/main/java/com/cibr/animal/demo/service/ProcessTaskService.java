package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysTaskBusinessMapper;
import com.cibr.animal.demo.dao.CibrSysTaskMapper;
import com.cibr.animal.demo.dao.CibrTaskProcessEmailMapper;
import com.cibr.animal.demo.dao.CibrTaskProcessMapper;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.EmailUtil;
import com.cibr.animal.demo.util.TaskUtil;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
























