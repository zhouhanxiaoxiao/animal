package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrSysRole;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrSysUserGroup;
import com.cibr.animal.demo.service.FileService;
import com.cibr.animal.demo.service.LoginService;
import com.cibr.animal.demo.service.RegisterService;
import com.cibr.animal.demo.service.UserService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "个人中心controller")
@RestController
public class UserController {

    @Autowired
    LoginService loginService;

    @Autowired
    private FileService fileService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    RegisterService registerService;

    @Autowired
    UserService userService;

    @ApiOperation(value = "获取所有用户信息")
    @RequestMapping(value = "/user/getAllUsers", method = RequestMethod.POST)
    public String refuseAllow(HttpServletRequest request,
                              HttpServletResponse response
    ) {
        ReturnData ret = new ReturnData();
        try {
//            List<CibrSysUser> allUsers = loginService.findAllUsers();
            List<CibrSysUser> allUsers = userService.selectAllUserWithDesc();
            Map<String, Object> retMap = new HashMap<>();
            retMap.put("users", allUsers);
            ret.setRetMap(retMap);
            ret.setCode("200");
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.WriteMapNullValue);
    }

    @ApiOperation("获取用户头像")
    @ApiImplicitParam(name = "userId", value = "用户ID", required = true, paramType = "path")
    @RequestMapping(value = "/user/userHead/{userId}", method = RequestMethod.GET)
    public void userHead(HttpServletRequest request,
                         HttpServletResponse response,
                         @PathVariable String userId) throws IOException {
        File userHead = fileService.getUserHead(userId);
        FileInputStream fileInputStream = new FileInputStream(userHead);
        ServletOutputStream outputStream = response.getOutputStream();
        //创建存放文件内容的数组
        byte[] buff = new byte[1024];
        //所读取的内容使用n来接收
        int n;
        //当没有读取完时,继续读取,循环
        while ((n = fileInputStream.read(buff)) != -1) {
            //将字节数组的数据全部写入到输出流中
            outputStream.write(buff, 0, n);
        }
        outputStream.flush();
        outputStream.close();
        fileInputStream.close();
    }

    @ApiOperation(value = "获取验证码")
    @ApiImplicitParam(name = "token",value = "登录令牌", required = true, paramType = "header")
    @RequestMapping(value = "/personal/editPwd/sendVid",method = RequestMethod.POST)
    public String sendVid(HttpServletRequest request,
                          HttpServletResponse response) {
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            registerService.sendCode(user.getEmail());
            ret.setCode("200");
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.WriteMapNullValue);
    }

    @ApiOperation("修改密码")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "password", value = "新密码", required = true),
            @ApiImplicitParam(name = "vid", value = "验证码", required = true),
    })
    @RequestMapping(value = "/personal/editPassword/confirm", method = RequestMethod.POST)
    public String editPasswordConfirm(HttpServletRequest request,
                                      HttpServletResponse response,
                                      @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            String password = (String) requestBody.get("password");
            String vid = (String) requestBody.get("vid");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            boolean b = registerService.verificationCodeIsSame(user.getEmail(), vid);
            if (!b){
                ret.setCode("E503");
            }else {
                userService.updatePassword(password,vid,user);
                ret.setCode("200");
            }
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.WriteMapNullValue);
    }

    @ApiOperation(value = "初始化个人信息页面")
    @RequestMapping(value = "/user/manager/init", method = RequestMethod.POST)
    public String userManagerInit(HttpServletRequest request,
                          HttpServletResponse response) {
        ReturnData ret = new ReturnData();
        try {
            List<CibrSysUser> cibrSysUsers = userService.selectAllUserWithDesc();
            List<CibrSysRole> roles = userService.selectAllRoles();
            List<CibrSysUserGroup> groups = userService.selectAllGroups();
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("users",cibrSysUsers);
            retMap.put("roles",roles);
            retMap.put("groups",groups);
            ret.setRetMap(retMap);
            ret.setCode("200");
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.WriteMapNullValue);
    }


    @ApiOperation(value = "新增部门")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "name", value = "部门名称", required = true),
            @ApiImplicitParam(name = "groupAdmin", value = "部门负责人", required = false),
            @ApiImplicitParam(name = "userName", value = "部门负责人用户名", required = false),
            @ApiImplicitParam(name = "userEmail", value = "部门负责人邮箱", required = false),
            @ApiImplicitParam(name = "userPwd", value = "部门负责人密码", required = false),
            @ApiImplicitParam(name = "realPwd", value = "部门负责人密码", required = false),
    })
    @RequestMapping(value = "/user/manager/addNewDepartment", method = RequestMethod.POST)
    public String addNewDepartment(HttpServletRequest request,
                                      HttpServletResponse response,
                                      @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            String name = (String) requestBody.get("name");
            String groupAdmin = String.valueOf(requestBody.get("groupAdmin"));
            String userName = String.valueOf(requestBody.get("userName"));
            String userEmail = String.valueOf(requestBody.get("userEmail"));
            String userPwd = String.valueOf(requestBody.get("userPwd"));
            String realPwd = String.valueOf(requestBody.get("realPwd"));
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            String code = userService.addNewDepartment(name, groupAdmin,userName,userEmail,userPwd,realPwd, user);
            ret.setCode(code);
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.WriteMapNullValue);
    }

    @ApiOperation(value = "批量更新用户角色")
    @ApiImplicitParam(name = "users", value = "用户详情集合字符串", required = true, paramType = "String")
    @RequestMapping(value = "/user/manager/updateUsers", method = RequestMethod.POST)
    public String updateUsers(HttpServletRequest request,
                                   HttpServletResponse response,
                                   @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            String usersStr = (String) requestBody.get("users");
            List<CibrSysUser> users = JSONObject.parseArray(usersStr, CibrSysUser.class);
            userService.updateusers(users);
            ret.setCode("200");
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.WriteMapNullValue);
    }

    @ApiOperation(value = "新增角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "name", value = "角色名称", required = true),
            @ApiImplicitParam(name = "index", value = "角色编号", required = true)
    })
    @RequestMapping(value = "/user/manager/addNewRole", method = RequestMethod.POST)
    public String addNewRole(HttpServletRequest request,
                                   HttpServletResponse response,
                                   @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            String name = (String) requestBody.get("name");
            String index = (String) requestBody.get("index");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            String code = userService.addnewRole(name,index,user);
            ret.setCode(code);
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.WriteMapNullValue);
    }
}
