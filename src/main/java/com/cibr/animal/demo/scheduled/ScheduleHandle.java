package com.cibr.animal.demo.scheduled;

import com.cibr.animal.demo.dao.CibrRecordMeterialMapper;
import com.cibr.animal.demo.dao.CibrSysUserMapper;
import com.cibr.animal.demo.dao.CibrTaskPartnerMapper;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.service.EmailService;
import com.cibr.animal.demo.util.TaskUtil;
import com.cibr.animal.demo.util.TimeUtil;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
            for (CibrTaskPartner partner : partners){
                String[] records = partner.getRecordid().split("##");
                CibrRecordMeterialExample example = new CibrRecordMeterialExample();
                example.createCriteria().andIdIn(Arrays.asList(records));
                List<CibrRecordMeterial> recordMeterials = recordMeterialMapper.selectByExample(example);
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
        }
    }
}
