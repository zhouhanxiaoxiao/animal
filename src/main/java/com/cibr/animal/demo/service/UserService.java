package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysRoleMapper;
import com.cibr.animal.demo.dao.CibrSysUserMapper;
import com.cibr.animal.demo.dao.CibrSysUserRoleMapper;
import com.cibr.animal.demo.entity.CibrSysRole;
import com.cibr.animal.demo.entity.CibrSysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private CibrSysUserMapper userMapper;

    @Autowired
    private CibrSysRoleMapper roleMapper;

    @Autowired
    private CibrSysUserRoleMapper userRoleMapper;

    /**
     *
     * @param roleType
     * @return
     */
    public List<CibrSysUser> getUsersByRole(String roleType){
        return userMapper.selectUserByRoleType(roleType);
    }

    public CibrSysUser getUserById(String userId){
        return userMapper.selectByPrimaryKey(userId);
    }
}
