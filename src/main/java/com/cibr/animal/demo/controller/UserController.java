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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("/user/getAllUsers")
    public String refuseAllow(HttpServletRequest request,
                              HttpServletResponse response
    ) {
        ReturnData ret = new ReturnData();
        try {
            List<CibrSysUser> allUsers = loginService.findAllUsers();
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

    @RequestMapping("/user/userHead/{userId}")
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

    @RequestMapping("/personal/editPwd/sendVid")
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

    @RequestMapping("/personal/editPassword/confirm")
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


    @RequestMapping("/user/manager/init")
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

    @RequestMapping("/user/manager/addNewDepartment")
    public String addNewDepartment(HttpServletRequest request,
                                      HttpServletResponse response,
                                      @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            String name = (String) requestBody.get("name");
            String groupAdmin = (String) requestBody.get("groupAdmin");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            String code = userService.addNewDepartment(name, groupAdmin, user);
            ret.setCode(code);
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/user/manager/updateUsers")
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

    @RequestMapping("/user/manager/addNewRole")
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
