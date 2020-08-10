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
public class LoginService {

    @Autowired
    private CibrSysUserMapper cibrSysUserMapper;

    @Autowired
    private CibrSysUserRoleMapper userRoleMapper;

    @Autowired
    private CibrSysRoleMapper roleMapper;

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

    public List<CibrSysRole> getRoles(String userId){
        CibrSysUserRoleExample userRoleExample = new CibrSysUserRoleExample();
        userRoleExample.createCriteria().andUseridEqualTo(userId);
        List<CibrSysUserRole> cibrSysUserRoles = userRoleMapper.selectByExample(userRoleExample);
        List<String> roleIds = new ArrayList<String>();
        for (CibrSysUserRole userRole : cibrSysUserRoles){
            roleIds.add(userRole.getRoleid());
        }
        CibrSysRoleExample roleExample = new CibrSysRoleExample();
        roleExample.createCriteria().andIdIn(roleIds);
        List<CibrSysRole> cibrSysRoles = roleMapper.selectByExample(roleExample);
        return cibrSysRoles;
    }
}
