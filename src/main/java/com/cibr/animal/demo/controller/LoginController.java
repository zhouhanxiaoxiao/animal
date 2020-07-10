package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.service.EmailService;
import com.cibr.animal.demo.service.LoginService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import com.cibr.animal.demo.util.Util;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private EmailService emailService;

    @RequestMapping("/login")
    public String login(@Param("loginEmail") String loginEmail, @Param("password") String password,HttpServletRequest request){
        ReturnData ret = new ReturnData();
        try {
            CibrSysUser user = loginService.findUser(loginEmail);
            Map retMap = new HashMap<String,Object>();
            if (user == null){
                ret.setCode("E510");
                ret.setErrMsg("用户不存在！");
            }else {
                if (!user.getPassword().equals(password)){
                    ret.setCode("E511");
                    ret.setErrMsg("密码错误！");
                }else {
                    String uuid = Util.getUUID();
                    redisUtil.set(uuid,user);
                    retMap.put("token",uuid);
                    user.setPassword("");
                    retMap.put("user",user);
                    ret.setCode("200");
                    ret.setRetMap(retMap);
                }
            }
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret);
    }
}

