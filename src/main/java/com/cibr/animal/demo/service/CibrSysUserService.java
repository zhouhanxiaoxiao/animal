package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysUserMapper;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrSysUserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CibrSysUserService {

    @Autowired
    CibrSysUserMapper userMapper;

    public List<CibrSysUser> findUserByEmail(String email){
        CibrSysUserExample userExample = new CibrSysUserExample();
        userExample.createCriteria().andEmailEqualTo(email);
        return userMapper.selectByExample(userExample);
    }

    public List<CibrSysUser> findUserByRole(String roleType){
        CibrSysUserExample example = new CibrSysUserExample();
        example.createCriteria().andRoleidEqualTo("1").andUserstatuEqualTo("2");
        return userMapper.selectByExample(example);
    }
}
