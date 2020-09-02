package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysTaskMapper;
import com.cibr.animal.demo.dao.CibrTaskPartnerMapper;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.EmailUtil;
import com.cibr.animal.demo.util.TaskUtil;
import com.cibr.animal.demo.util.TimeUtil;
import com.cibr.animal.demo.util.Util;
import javafx.concurrent.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Time;
import java.text.ParseException;
import java.util.*;

@Service
public class ResourceService {

    private Logger logger = LoggerFactory.getLogger(ResourceService.class);

    @Autowired
    private UserService userService;

    @Autowired
    private MeterialService meterialService;

    @Autowired
    private CibrSysTaskMapper taskMapper;

    @Autowired
    private CibrTaskPartnerMapper partnerMapper;

    @Autowired
    private EmailService emailService;

    public Map<String,Object> getAllResource(){
        Map<String,Object> retMap = new HashMap<>();
        List<CibrSysUser> feeds = userService.getUsersByRole("02");
        List<CibrSysMaterial> materials = meterialService.getAllMerialOnly();
        retMap.put("feeds",feeds);
        retMap.put("meterials",materials);
        return retMap;
    }

    public List<CibrRecordMeterial> getAllRecords(String recordId){
        return meterialService.getAllRecords(recordId);
    }

    public List<CibrRecordMeterial> findCurrentDate(Date currentDate, String resource) throws ParseException {
        Date afterOneDay = TimeUtil.dateAdd(currentDate,Calendar.DATE,1);
        Date startTime = TimeUtil.str2date(TimeUtil.date2str(currentDate,"yyyy-MM-dd"),"yyyy-MM-dd");
        Date endTime = TimeUtil.str2date(TimeUtil.date2str(afterOneDay,"yyyy-MM-dd"),"yyyy-MM-dd");
        return meterialService.findRecordsByTimes(startTime,endTime,resource);
    }

    @Transactional(rollbackFor = Exception.class)
    public void commitTimes(String resourceId, List<Date> times, CibrSysUser user) throws ParseException {
        List<CibrRecordMeterial> recordMeterials = new ArrayList<>();
        for (Date time : times){
            time = TimeUtil.str2date(TimeUtil.date2str(time,"yyyy-MM-dd HH"),"yyyy-MM-dd HH");
            CibrRecordMeterial recordMeterial = new CibrRecordMeterial();
            recordMeterial.setId(Util.getUUID());
            recordMeterial.setResourceid(resourceId);
            recordMeterial.setStarttime(time);
            recordMeterial.setEndtime(TimeUtil.dateAdd(time,Calendar.HOUR,1));
            recordMeterial.setCreatetime(new Date());
            recordMeterial.setCreater(user.getId());
            recordMeterials.add(recordMeterial);
        }
        meterialService.batchInsertRecords(recordMeterials);

        CibrSysUser userById = userService.getUserById(resourceId);
        if (userById != null){
            CibrSysTask task = new CibrSysTask();
            String taskId = Util.getUUID();
            task.setId(taskId);
            task.setTasktype(TaskUtil.PARTNER_TASK);
            task.setCreateuser(user.getId());
            task.setCreatetime(new Date());
            task.setTaskstatu(TaskUtil.TASK_STATU_TODO);
            task.setCurrentuser(resourceId);
            taskMapper.insert(task);

            CibrTaskPartner partner = new CibrTaskPartner();
            partner.setId(taskId);
            partner.setTaskid(task.getId());
            partner.setCreater(user.getId());
            partner.setCreatetime(new Date());
            partner.setTaskstatu(TaskUtil.PARTNER_TASK_UNDO);
            String recordIds = "";
            for (CibrRecordMeterial meterial : recordMeterials){
                recordIds += meterial.getId() + "##";
            }
            partner.setRecordid(recordIds);
            partnerMapper.insert(partner);

            String content = "";
            content += Util.EMAIL_PREFIX + "您有一个【" + TaskUtil.TASK_PARTNER + "】任务，发起人【" +
                   user.getName() + "】，请及时处理！" + Util.EMAIL_SUFFIX;
            emailService.simpleSendEmail(content,userById.getEmail(),TaskUtil.TASK_PARTNER);
        }
    }
}
