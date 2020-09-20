package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrSysUserGroup;
import com.cibr.animal.demo.entity.CibrSysVerification;
import com.cibr.animal.demo.service.CibrSysUserService;
import com.cibr.animal.demo.service.EmailService;
import com.cibr.animal.demo.service.RegisterService;
import com.cibr.animal.demo.util.ReturnData;
import com.cibr.animal.demo.util.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

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
            String registerEmail = request.getParameter("registerEmail");
            /*判断该邮箱是否已注册*/
            List<CibrSysUser> userByEmail = userService.findUserByEmail(registerEmail);
            if (userByEmail != null && userByEmail.size()>0){
                /*邮箱已注册*/
                CibrSysUser user = userByEmail.get(0);
                if ("1".equals(user.getUserstatu() )){
                    /*邮箱已注册未审核*/
                    returnData.setCode("E501");
                    returnData.setErrMsg("该邮箱已注册，请等待管理员审核！");
                }else {
                    returnData.setCode("E502");
                    returnData.setErrMsg("该邮箱已注册！");
                }
            }else {
                /*发送验证码*/
                Map<String, String> stringObjectMap = registerService.sendCode(registerEmail);
                if ("f".equals(stringObjectMap.get("succ"))
                        && stringObjectMap.get("errmsg").contains("邮箱地址不存在")){
                    returnData.setCode("E505");
                    returnData.setErrMsg("邮箱不存在！");
                }else {
                    returnData.setCode("200");
                }
            }
        } catch (Exception e){
            returnData.setCode("E500");
            returnData.setErrMsg("获取验证码失败，稍后重试！");
            e.printStackTrace();
        }
        return JSON.toJSONString(returnData, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/submit")
    public String initUser(HttpServletRequest request,
                           HttpServletResponse response){
        ReturnData returnData = new ReturnData();
        returnData.setRetMap(new HashMap());
        try{
            String registerName = request.getParameter("registerName");
            String registerEmail = request.getParameter("registerEmail");
            String registerPwd = request.getParameter("registerPwd");
            String verificationCode = request.getParameter("verificationCode");
            String usergroup = request.getParameter("usergroup");
            /*判断该邮箱是否已注册*/
            List<CibrSysUser> userByEmail = userService.findUserByEmail(registerEmail);
            CibrSysVerification verification = registerService.findVerification(registerEmail, verificationCode);
            if (userByEmail != null && userByEmail.size()>0){
                /*邮箱已注册*/
                CibrSysUser user = userByEmail.get(0);
                if ("1".equals(user.getUserstatu() )){
                    /*邮箱已注册未审核*/
                    returnData.setCode("E501");
                    returnData.setErrMsg("该邮箱已注册，请等待管理员审核！");
                }else {
                    returnData.setCode("E502");
                    returnData.setErrMsg("该邮箱已注册！");
                }
            }else if (verification == null){
                returnData.setCode("E503");
                returnData.setErrMsg("验证码校验不通过！");
            }else {
                Date createtime = verification.getCreatetime();
                if (createtime.compareTo(TimeUtil.dateAdd(new Date(), Calendar.HOUR,-1))<0){
                    returnData.setCode("E504");
                    returnData.setErrMsg("验证码已过期，请重新发送！");
                }else {
                    /*用户注册流程*/
                    registerService.createUser(registerName,registerEmail,registerPwd,usergroup);
                    returnData.setCode("200");
                }
            }
        }catch (Exception e){
            returnData.setCode("E500");
            returnData.setErrMsg("注册失败失败，稍后重试！");
            e.printStackTrace();
        }
        return JSON.toJSONString(returnData, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/getGroups")
    public String getGroup(){
        ReturnData returnData = new ReturnData();
        try {
            Map<String,Object> retMap = new HashMap<>();
            List<CibrSysUserGroup> group = registerService.getGroup();
            retMap.put("groups",group);
            returnData.setCode("200");
            returnData.setRetMap(retMap);
        }catch (Exception e){
            returnData.setCode("E500");
            e.printStackTrace();
        }
        return JSON.toJSONString(returnData, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }
}
