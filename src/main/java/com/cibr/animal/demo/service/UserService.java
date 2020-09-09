package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysRoleMapper;
import com.cibr.animal.demo.dao.CibrSysUserMapper;
import com.cibr.animal.demo.dao.CibrSysUserRoleMapper;
import com.cibr.animal.demo.entity.CibrSysRole;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrSysUserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    private CibrSysUserMapper userMapper;

    @Autowired
    private CibrSysRoleMapper roleMapper;

    @Autowired
    private CibrSysUserRoleMapper userRoleMapper;

    @Autowired
    private RegisterService registerService;

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

    public void updateUserById(CibrSysUser user){
        userMapper.updateByPrimaryKey(user);
    }

    public void updatePassword(String password, String vid, CibrSysUser user) {
        user.setPassword(password);
        userMapper.updateByPrimaryKey(user);
    }

    public Map<String,CibrSysUser> getuuid_user(){
        List<CibrSysUser> cibrSysUsers = userMapper.selectByExample(new CibrSysUserExample());
        Map<String,CibrSysUser> uuid_user = new HashMap<>();
        for (CibrSysUser user : cibrSysUsers){
            uuid_user.put(user.getId(),user);
        }
        return uuid_user;
    }

    public List<CibrSysUser> getAllUers(){
        return userMapper.selectByExample(new CibrSysUserExample());
    }

    public Map<String,CibrSysUser> getName_User(){
        List<CibrSysUser> cibrSysUsers = userMapper.selectByExample(new CibrSysUserExample());
        Map<String,CibrSysUser> name_user = new HashMap<>();
        for (CibrSysUser user : cibrSysUsers){
            name_user.put(user.getName(),user);
        }
        return name_user;
    }
}
