package com.cibr.animal.demo.scheduled;

import com.cibr.animal.demo.dao.*;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.service.EmailService;
import com.cibr.animal.demo.util.TaskUtil;
import com.cibr.animal.demo.util.TimeUtil;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Component
public class ScheduleHandle {


    @Autowired
    private CibrTaskPartnerMapper partnerMapper;

    @Autowired
    private CibrSysUserMapper userMapper;

    @Autowired
    private CibrRecordMeterialMapper recordMeterialMapper;

    @Autowired
    private EmailService emailService;

    @Autowired
    private CibrSysTaskMapper taskMapper;

    @Autowired
    private CibrTaskFailMapper failMapper;

    @Transactional(rollbackFor = Exception.class)
    public void checkPartnerTask() {
        CibrTaskPartnerExample partnerExample = new CibrTaskPartnerExample();
        Date now = new Date();
        Date oneDayBefore = TimeUtil.dateAdd(now, Calendar.HOUR,-1);
        partnerExample.createCriteria()
                .andCreatetimeLessThan(oneDayBefore)
                .andTaskstatuEqualTo(TaskUtil.PARTNER_TASK_UNDO);
        List<CibrTaskPartner> partners = partnerMapper.selectByExample(partnerExample);
        if (partners != null && partners.size() > 0){
            Map<String,CibrSysUser> uuid_user = new HashMap<>();
            List<CibrSysUser> cibrSysUsers = userMapper.selectByExample(new CibrSysUserExample());
            for (CibrSysUser user : cibrSysUsers){
                uuid_user.put(user.getId(),user);
            }
            List<CibrTaskPartner> updatePartnerList = new ArrayList<>();
            List<String> taskIds = new ArrayList<>();
            List<CibrTaskFail> failList = new ArrayList<>();
            for (CibrTaskPartner partner : partners){
                String[] records = partner.getRecordid().split("##");
                CibrRecordMeterialExample example = new CibrRecordMeterialExample();
                example.createCriteria().andIdIn(Arrays.asList(records));
                List<CibrRecordMeterial> recordMeterials = recordMeterialMapper.selectByExample(example);
                Date currentDate = new Date();
                boolean hasAfterTime = false;
                String rem = "";
                for (CibrRecordMeterial record : recordMeterials){
                    rem += "自 " + TimeUtil.date2str(record.getStarttime(),"yyyy-MM-dd HH:00")
                            + " 到 " + TimeUtil.date2str(record.getEndtime(),"yyyy-MM-dd HH:00")
                            + "    ";
                    Date endtime = record.getEndtime();
                    if (endtime.compareTo(currentDate) > 0){
                        hasAfterTime = true;
                    }
                }
                if (!hasAfterTime){
                    recordMeterialMapper.deleteByExample(example);
                    partner.setTaskstatu(TaskUtil.PARTNER_TASK_PASSTIME);
                    partner.setRemark(rem);
                    updatePartnerList.add(partner);
                    taskIds.add(partner.getTaskid());
                    CibrTaskFail fail = new CibrTaskFail();
                    fail.setId(Util.getUUID());
                    fail.setReason("已过期");
                    fail.setCreatetime(new Date());
                    fail.setHandler("system");
                    fail.setDetailid(partner.getId());
                    failList.add(fail);
                    continue;
                }
                String userId = recordMeterials.get(0).getResourceid();
                CibrSysUser resource = uuid_user.get(userId);
                CibrSysUser user = uuid_user.get(partner.getCreater());
                String content = Util.EMAIL_PREFIX + "您有一个【" + TaskUtil.TASK_PARTNER + "】任务超过1小时未确认，请联系【" +
                        resource.getEmail() + "】。";
                content += Util.EMAIL_SUFFIX;
                emailService.simpleSendEmail(content,user.getEmail(), Util.EMAIL_SUB_OVERTIME);
                content = Util.EMAIL_PREFIX + "您有一个【" + TaskUtil.TASK_PARTNER + "】任务超过1小时未确认!申请人【" + user.getName() + "】";
                content += Util.EMAIL_SUFFIX;
                emailService.simpleSendEmail(content,resource.getEmail(), Util.EMAIL_SUB_OVERTIME);
            }
            if (taskIds.size()>0){
                CibrSysTaskExample taskExample = new CibrSysTaskExample();
                taskExample.createCriteria().andIdIn(taskIds);
                List<CibrSysTask> cibrSysTasks = taskMapper.selectByExample(taskExample);
                if (cibrSysTasks.size()>0){
                    for (CibrSysTask task : cibrSysTasks){
                        task.setTaskstatu(TaskUtil.TASK_STATU_FAIL);
                        task.setHandletime(new Date());
                        task.setTaskdesc("已过期");
                    }
                    taskMapper.batchUpdate(cibrSysTasks);
                    failMapper.batchInsert(failList);
                    partnerMapper.batchUpdate(updatePartnerList);
                    for (CibrSysTask task : cibrSysTasks){
                        CibrSysUser user = uuid_user.get(task.getCreateuser());
                        String content = Util.EMAIL_PREFIX + "您有一个【" + TaskUtil.TASK_PARTNER + "】任务已过期未确认，任务状态已自动转变为失败。";
                        content += Util.EMAIL_SUFFIX;
                        emailService.simpleSendEmail(content,user.getEmail(), Util.EMAIL_SUB_OVERTIME);
                    }
                }
            }
        }
    }
}
