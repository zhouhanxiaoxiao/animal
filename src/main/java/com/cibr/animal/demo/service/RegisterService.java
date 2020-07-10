package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysUserMapper;
import com.cibr.animal.demo.dao.CibrSysVerificationMapper;
import com.cibr.animal.demo.entity.CibrSysEmail;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrSysVerification;
import com.cibr.animal.demo.entity.CibrSysVerificationExample;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class RegisterService {

    @Autowired
    CibrSysUserMapper userMapper;

    @Autowired
    CibrSysVerificationMapper verificationMapper;

    @Autowired
    EmailService emailService;


    /**
     * 发送验证码邮件
     * @param registerEmail
     */
    public void sendCode(String registerEmail) {
        String code = String.valueOf(Util.getVerificationCode());
        String emailMsg = Util.getVerificationTemplate(code);
        CibrSysEmail email = emailService.createCibrSysEmail(registerEmail,emailMsg, Util.EMAIL_SUB_VERCODE);
        emailService.sendMail(email);
        CibrSysVerification verification = new CibrSysVerification();
        verification.setId(Util.getUUID());
        verification.setCode(code);
        verification.setEmail(registerEmail);
        verification.setCreatetime(new Date());
        verificationMapper.insert(verification);
    }

    public boolean verificationCodeIsSame(String email,String code){
        CibrSysVerification verification = findVerification(email, code);
        if (verification == null){
            return false;
        }else {
            return true;
        }
    }

    public CibrSysVerification findVerification(String email,String code){
        CibrSysVerificationExample example = new CibrSysVerificationExample();
        example.createCriteria().andEmailEqualTo(email).andCodeEqualTo(code);
        example.setOrderByClause("createTime DESC");
        List<CibrSysVerification> cibrSysVerifications = verificationMapper.selectByExample(example);
        if (cibrSysVerifications == null || cibrSysVerifications.size() == 0){
            return  null;
        }else {
            return cibrSysVerifications.get(0);
        }
    }

    public void createUser(String registerName, String registerEmail, String registerPwd) {
        CibrSysUser user = new CibrSysUser();
        user.setId(Util.getUUID());
        user.setName(registerName);
        user.setUserstatu("1");
        user.setPassword(registerPwd);
        user.setEmail(registerEmail);
        user.setRoleid("9");
        //TO-DO 权限设置 发送邮件给管理员
        userMapper.insert(user);
    }
}
