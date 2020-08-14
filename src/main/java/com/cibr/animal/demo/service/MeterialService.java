package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysMaterialMapper;
import com.cibr.animal.demo.entity.CibrRecordMeterial;
import com.cibr.animal.demo.entity.CibrSysMaterial;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class MeterialService {
    @Autowired
    CibrSysMaterialMapper materialMapper;

    public List<CibrSysMaterial> getAllMerial(){
        return materialMapper.selectAll(new HashMap());
    }
}
