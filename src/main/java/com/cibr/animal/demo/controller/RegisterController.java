package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.cibr.animal.demo.entity.CibrSysEmail;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.service.CibrSysUserService;
import com.cibr.animal.demo.service.EmailService;
import com.cibr.animal.demo.service.RegisterService;
import com.cibr.animal.demo.util.ReturnData;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    EmailService emailService;

    @Autowired
    RegisterService registerService;

    @Autowired
    CibrSysUserService userService;

    @RequestMapping("/getVerification")
    public String getVerification(HttpServletRequest request,
                                  HttpServletResponse response) {
        ReturnData returnData = new ReturnData();
        returnData.setRetMap(new HashMap());
        try {
            boolean userIsExist = false;
            String registerName = request.getParameter("registerName");
            String registerEmail = request.getParameter("registerEmail");
            String registerPwd = request.getParameter("registerPwd");

            CibrSysUser user = new CibrSysUser();
            List<CibrSysUser> userByEmail = userService.findUserByEmail(registerEmail);
            user.setId(Util.getUUID());
            if (userByEmail != null && userByEmail.size()>0){
                if (!"0".equals(userByEmail.get(0).getUserstatu())){
                    returnData.setCode("500");
                    returnData.setErrMsg("该邮箱已注册，请更换邮箱或直接登录！");
                    return JSON.toJSONString(returnData);
                }else {
                    userIsExist = true;
                    user = userByEmail.get(0);
                }
            }
            user.setName(registerName);
            user.setEmail(registerEmail);
            user.setPassword(registerPwd);
            String code = String.valueOf(Util.getVerificationCode());
            user.setRoleid("0");
            user.setUserdesc(code);
            String emailMsg = Util.getVerificationTemplate(code);
            CibrSysEmail email = emailService.createCibrSysEmail(registerEmail,emailMsg,Util.EMAIL_SUB_VERCODE);
            emailService.sendMail(email);
            if (userIsExist){
                registerService.updateTmpUser(user);
            }else {
                registerService.createTmpUser(user);
            }
            returnData.getRetMap().put("VerificationCode",code);
            returnData.setCode("200");
        }catch (Exception e){
            returnData.setCode("500");
            returnData.setErrMsg("获取验证码失败，稍后重试！");
            e.printStackTrace();
        }
        return JSON.toJSONString(returnData);
    }

    @RequestMapping("/submit")
    public String initUser(){
        ReturnData returnData = new ReturnData();
        returnData.setRetMap(new HashMap());
        try{

        }catch (Exception e){
            returnData.setCode("500");
            returnData.setErrMsg("注册失败失败，稍后重试！");
            e.printStackTrace();
        }
        return JSON.toJSONString(returnData);
    }
}
