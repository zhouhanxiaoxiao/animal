package com.cibr.animal.demo.service;

import com.cibr.animal.demo.entity.CibrRecordMeterial;
import com.cibr.animal.demo.entity.CibrRecordMeterialExample;
import com.cibr.animal.demo.entity.CibrSysMaterial;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.util.TimeUtil;
import com.cibr.animal.demo.util.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    }
}
