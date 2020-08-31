package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrRecordMeterialMapper;
import com.cibr.animal.demo.dao.CibrSysMaterialMapper;
import com.cibr.animal.demo.entity.CibrRecordMeterial;
import com.cibr.animal.demo.entity.CibrRecordMeterialExample;
import com.cibr.animal.demo.entity.CibrSysMaterial;
import com.cibr.animal.demo.entity.CibrSysMaterialExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class MeterialService {
    @Autowired
    private CibrSysMaterialMapper materialMapper;

    @Autowired
    private CibrRecordMeterialMapper recordMeterialMapper;

    public List<CibrSysMaterial> getAllMerial(){
        return materialMapper.selectAll(new HashMap());
    }

    public List<CibrSysMaterial> getAllMerialOnly(){
        CibrSysMaterialExample example = new CibrSysMaterialExample();
        return materialMapper.selectByExample(example);
    }

    public List<CibrRecordMeterial> getAllRecords(String metid){
        CibrRecordMeterialExample example = new CibrRecordMeterialExample();
        example.createCriteria().andResourceidEqualTo(metid);
        example.setOrderByClause("startTime desc");
        return recordMeterialMapper.selectByExample(example);
    }

    public List<CibrRecordMeterial> findRecordsByTimes(Date start,Date end,String resourceId){
        CibrRecordMeterialExample example = new CibrRecordMeterialExample();
        example.createCriteria().andStarttimeGreaterThanOrEqualTo(start)
                .andEndtimeLessThan(end).andResourceidEqualTo(resourceId);
        return recordMeterialMapper.selectByExample(example);
    }

    public void batchInsertRecords(List<CibrRecordMeterial> recordMeterials) {
        recordMeterialMapper.batchInsert(recordMeterials);
    }
}
