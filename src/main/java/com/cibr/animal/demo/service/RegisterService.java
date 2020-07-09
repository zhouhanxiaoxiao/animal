package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysUserMapper;
import com.cibr.animal.demo.entity.CibrSysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterService {

    @Autowired
    CibrSysUserMapper userMapper;

    public void createTmpUser(CibrSysUser user){
        user.setUserstatu("0");
        userMapper.insert(user);
    }

    public void updateTmpUser(CibrSysUser user) {
        user.setUserstatu("0");
        userMapper.updateByPrimaryKey(user);
    }
}
