package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrSysRole;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrSysVerification;
import com.cibr.animal.demo.service.EmailService;
import com.cibr.animal.demo.service.LoginService;
import com.cibr.animal.demo.service.RegisterService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import com.cibr.animal.demo.util.Util;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private EmailService emailService;

    @Autowired
    private RegisterService registerService;

    @RequestMapping("/login")
    public String login(@Param("loginEmail") String loginEmail,
                        @Param("password") String password,
                        @Param("verification") String verification,
                        @Param("loginFlag") boolean loginFlag,
                        HttpServletRequest request){
        ReturnData ret = new ReturnData();
        try {
            CibrSysUser user = loginService.findUser(loginEmail);
            CibrSysVerification v = registerService.findVerification(loginEmail, verification);
            Map retMap = new HashMap<String,Object>();
            if (user == null){
                ret.setCode("E510");
                ret.setErrMsg("用户不存在！");
            }else {
                if (!user.getPassword().equals(password)
                        && loginFlag
                ){
                    ret.setCode("E511");
                    ret.setErrMsg("密码错误！");
                }else if (!loginFlag && v == null){
                    ret.setCode("E503");
                    ret.setErrMsg("验证码校验不通过！");
                }else {
                    if ("1".equals(user.getUserstatu())){
                        ret.setCode("E501");
                    }else if ("3".equals(user.getUserstatu())){
                        ret.setCode("E510");
                        ret.setErrMsg("用户不存在！");
                    }
                    else {
                        String uuid = Util.getUUID();
                        List<CibrSysRole> roles = loginService.getRoles(user.getId());
                        user.setRoles(roles);
                        redisUtil.set(uuid,JSON.toJSONString(user));
                        retMap.put("token",uuid);
                        retMap.put("user",user);
                        ret.setCode("200");
                        ret.setRetMap(retMap);
                    }
                }
            }
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/system/exit")
    public String exitSystem(HttpServletRequest request){
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            redisUtil.delete(token);
            ret.setCode("200");
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/login/getVerification")
    public String getVerification(@Param("loginEmail") String loginEmail){
        ReturnData ret = new ReturnData();
        try {
            CibrSysUser user = loginService.findUser(loginEmail);
            if (user == null){
                ret.setCode("E510");
                ret.setErrMsg("用户不存在！");
            }else {
                /*发送验证码*/
                Map<String, String> stringObjectMap = registerService.sendCode(loginEmail);
                if ("f".equals(stringObjectMap.get("succ"))
                        && stringObjectMap.get("errmsg").contains("邮箱地址不存在")){
                    ret.setCode("E505");
                    ret.setErrMsg("邮箱不存在！");
                }else {
                    ret.setCode("200");
                }
            }
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }
}

