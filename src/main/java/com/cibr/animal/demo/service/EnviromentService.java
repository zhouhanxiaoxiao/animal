package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysEnvironmentMapper;
import com.cibr.animal.demo.entity.CibrSysEnvironment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnviromentService {

    @Autowired
    CibrSysEnvironmentMapper environmentMapper;

    public List<CibrSysEnvironment> getEnvs (){
        return environmentMapper.selectAllRecord();
    }
}
