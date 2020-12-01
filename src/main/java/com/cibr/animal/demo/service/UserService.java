package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysRoleMapper;
import com.cibr.animal.demo.dao.CibrSysUserGroupMapper;
import com.cibr.animal.demo.dao.CibrSysUserMapper;
import com.cibr.animal.demo.dao.CibrSysUserRoleMapper;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
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

    @Autowired
    private CibrSysUserGroupMapper groupMapper;

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

    public List<CibrSysUser> selectAllUserWithDesc() {
        return userMapper.selectAllUserWithDesc();
    }

    public List<CibrSysRole> selectAllRoles() {
        return roleMapper.selectByExample(new CibrSysRoleExample());
    }

    public List<CibrSysUserGroup> selectAllGroups() {
        return groupMapper.selectByExample(new CibrSysUserGroupExample());
    }

    @Transactional(rollbackFor = Exception.class)
    public String addNewDepartment(String name, String groupAdmin,String userName,String userEmail,String userPwd, CibrSysUser user) {
        CibrSysUserGroupExample groupExample = new CibrSysUserGroupExample();
        groupExample.createCriteria().andGroupnameEqualTo(name);
        List<CibrSysUserGroup> groups = groupMapper.selectByExample(groupExample);
        if (groups != null && groups.size() != 0){
            return "E550";
        }
        CibrSysUserGroup newGroup = new CibrSysUserGroup();
        newGroup.setId(Util.getUUID());
        newGroup.setGroupname(name);
        newGroup.setGroupstatu("01");
        newGroup.setGrouptype("1");
        if (!StringUtils.isEmpty(groupAdmin)){
            CibrSysUser user1 = userMapper.selectByPrimaryKey(groupAdmin);
            user1.setRoleid(newGroup.getId());
            userMapper.updateByPrimaryKey(user1);
        }else {
            CibrSysUser admin = new CibrSysUser();
            admin.setId(Util.getUUID());
            admin.setName(userName);
            admin.setRoleid(newGroup.getId());
            admin.setPassword(userPwd);
            admin.setEmail(userEmail);
            admin.setUserstatu("2");
            groupAdmin = admin.getId();
            CibrSysUserRole userRole = new CibrSysUserRole();
            userRole.setUserid(admin.getId());
            CibrSysRoleExample roleExample = new CibrSysRoleExample();
            roleExample.createCriteria().andRoletypeEqualTo(Util.ROLE_TYPE_REVIEWER);
            List<CibrSysRole> roles = roleMapper.selectByExample(roleExample);
            userRole.setRoleid(roles.get(0).getId());
            userMapper.insert(admin);
            userRoleMapper.insert(userRole);
        }
        newGroup.setGroupadmin(groupAdmin);
        groupMapper.insert(newGroup);
        return "200";
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateusers(List<CibrSysUser> users) {
        for (CibrSysUser user : users){
            CibrSysUserRoleExample userRoleExample = new CibrSysUserRoleExample();
            userRoleExample.createCriteria().andUseridEqualTo(user.getId());
            userRoleMapper.deleteByExample(userRoleExample);
            List<CibrSysUserRole> roles = new ArrayList<>();
            for (String roleid : user.getRolesIds()){
                CibrSysUserRole userRole = new CibrSysUserRole();
                userRole.setRoleid(roleid);
                userRole.setUserid(user.getId());
                roles.add(userRole);
            }
            userRoleMapper.batchInsert(roles);
        }
        userMapper.batchUpdate(users);
    }

    @Transactional(rollbackFor = Exception.class)
    public String addnewRole(String name, String index, CibrSysUser user) {
        CibrSysRoleExample roleExample = new CibrSysRoleExample();
        roleExample.createCriteria().andRolenameEqualTo(name);
        List<CibrSysRole> roles = roleMapper.selectByExample(roleExample);
        if (roles != null && roles.size()>0){
            return "E551";
        }
        roleExample = new CibrSysRoleExample();
        roleExample.createCriteria().andRoletypeEqualTo(index);
        roles = new ArrayList<>();
        roles = roleMapper.selectByExample(roleExample);
        if (roles.size() > 0){
            return "E552";
        }
        CibrSysRole role = new CibrSysRole();
        role.setId(Util.getUUID());
        role.setRolename(name);
        role.setRoletype(index);
        roleMapper.insert(role);
        return "200";
    }

    public Map<String,CibrSysUserGroup> getuuid_group() {
        List<CibrSysUserGroup> groups = groupMapper.selectByExample(new CibrSysUserGroupExample());
        Map<String,CibrSysUserGroup> uuid_group = new HashMap<>();
        if (groups != null && groups.size()>0){
            for (CibrSysUserGroup group : groups){
                uuid_group.put(group.getId(),group);
            }
        }
        return uuid_group;
    }
}
