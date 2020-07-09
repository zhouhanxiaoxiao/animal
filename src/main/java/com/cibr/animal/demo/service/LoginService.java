package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysUserMapper;
import com.cibr.animal.demo.entity.CibrSysEmail;
import com.cibr.animal.demo.entity.CibrSysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private CibrSysUserMapper sysUserMapper;



    public CibrSysUser getuser(){
        return sysUserMapper.selectByPrimaryKey("ddd");
    }

}
