package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysUserMapper;
import com.cibr.animal.demo.entity.CibrSysEmail;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrSysUserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginService {

    @Autowired
    private CibrSysUserMapper cibrSysUserMapper;

    public CibrSysUser findUser(String email){
        CibrSysUserExample example = new CibrSysUserExample();
        example.createCriteria().andEmailEqualTo(email);
        List<CibrSysUser> cibrSysUsers = cibrSysUserMapper.selectByExample(example);
        if (cibrSysUsers == null || cibrSysUsers.size() == 0){
            return null;
        }else {
            return cibrSysUsers.get(0);
        }
    }
}
