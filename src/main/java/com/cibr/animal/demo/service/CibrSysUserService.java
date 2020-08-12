package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysRoleMapper;
import com.cibr.animal.demo.dao.CibrSysUserMapper;
import com.cibr.animal.demo.dao.CibrSysUserRoleMapper;
import com.cibr.animal.demo.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CibrSysUserService {

    @Autowired
    CibrSysUserMapper userMapper;

    @Autowired
    CibrSysRoleMapper roleMapper;

    @Autowired
    CibrSysUserRoleMapper userRoleMapper;

    public List<CibrSysUser> findUserByEmail(String email){
        CibrSysUserExample userExample = new CibrSysUserExample();
        userExample.createCriteria().andEmailEqualTo(email);
        return userMapper.selectByExample(userExample);
    }

    public List<CibrSysUser> findUserByRole(String roleType){
        CibrSysRoleExample roleExample = new CibrSysRoleExample();
        roleExample.createCriteria().andRoletypeEqualTo(roleType);
        List<CibrSysRole> cibrSysRoles = roleMapper.selectByExample(roleExample);

        CibrSysUserRoleExample userRoleExample = new CibrSysUserRoleExample();
        userRoleExample.createCriteria().andRoleidEqualTo(cibrSysRoles.get(0).getId());
        List<CibrSysUserRole> cibrSysUserRoles = userRoleMapper.selectByExample(userRoleExample);
        List<String> userIds = new ArrayList<String>();

        if (cibrSysUserRoles == null || cibrSysUserRoles.size() == 0){
            return new ArrayList<>();
        }

        for (CibrSysUserRole userRole : cibrSysUserRoles){
            userIds.add(userRole.getUserid());
        }

        CibrSysUserExample example = new CibrSysUserExample();
        example.createCriteria().andIdIn(userIds);
        return userMapper.selectByExample(example);
    }

    public List<CibrSysUser> findUserByIds(List<String> userids){
        if (userids == null || userids.size() == 0){
            return new ArrayList<>();
        }
        CibrSysUserExample userExample = new CibrSysUserExample();
        userExample.createCriteria().andIdIn(userids);
        return userMapper.selectByExample(userExample);
    }
}
