package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.*;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.TaskUtil;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RegisterService {

    @Autowired
    CibrSysUserMapper userMapper;

    @Autowired
    CibrSysVerificationMapper verificationMapper;

    @Autowired
    EmailService emailService;

    @Autowired
    CibrSysTaskMapper taskMapper;

    @Autowired
    CibrSysRoleMapper roleMapper;

    @Autowired
    CibrSysUserRoleMapper userRoleMapper;
    /**
     * 发送验证码邮件
     * @param registerEmail
     */
    public Map<String,String> sendCode(String registerEmail) {
        Map<String,String> ret = new HashMap<String,String>();
        String code = String.valueOf(Util.getVerificationCode());
        String emailMsg = Util.getVerificationTemplate(code);
        CibrSysEmail email = emailService.createCibrSysEmail(registerEmail,emailMsg, Util.EMAIL_SUB_VERCODE);
        CibrSysEmail email1 = emailService.sendMail(email);
        if (email1.getEmailError() != null && email.getEmailError().contains("邮箱地址不存在")){
            ret.put("succ","f");
            ret.put("errmsg",email.getEmailError());
            return ret;
        }
        CibrSysVerification verification = new CibrSysVerification();
        verification.setId(Util.getUUID());
        verification.setCode(code);
        verification.setEmail(registerEmail);
        verification.setCreatetime(new Date());
        verificationMapper.insert(verification);
        ret.put("succ","t");
        return  ret;
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
        String userId = Util.getUUID();
        user.setId(userId);
        user.setName(registerName);
        user.setUserstatu("1");
        user.setPassword(registerPwd);
        user.setEmail(registerEmail);
        user.setRoleid("9");
        user.setCreatetime(new Date());
        //TO-DO 权限设置 发送邮件给管理员
        CibrSysTask task = new CibrSysTask();
        task.setId(Util.getUUID());
        task.setCreatetime(new Date());
        task.setCreateuser(userId);

        CibrSysRoleExample roleExample = new CibrSysRoleExample();
        roleExample.createCriteria().andRoletypeEqualTo("999999");
        List<CibrSysRole> cibrSysRoles = roleMapper.selectByExample(roleExample);

        CibrSysUserRoleExample userRoleExample = new CibrSysUserRoleExample();
        userRoleExample.createCriteria().andRoleidEqualTo(cibrSysRoles.get(0).getId());
        List<CibrSysUserRole> cibrSysUserRoles = userRoleMapper.selectByExample(userRoleExample);

        CibrSysUser adminer = userMapper.selectByPrimaryKey(cibrSysUserRoles.get(0).getUserid());

        task.setCurrentuser(adminer.getId());
        task.setTaskstatu(TaskUtil.ASK_TASK_STATU_TODO);
        task.setTasktype("01");
        taskMapper.insert(task);
        /*给管理员发送邮件提醒*/
        String emailMsg = Util.EMAIL_PREFIX +
                "您有一个用户注册审批任务，请及时处理。申请人【" + registerName + "】，邮箱【" + registerEmail + "】"
                + Util.EMAIL_SUFFIX;
        CibrSysEmail adminEmail = emailService.createCibrSysEmail(adminer.getEmail(), emailMsg, Util.USER_CREATE);
        emailService.sendMail(adminEmail);
        /*给申请者发送邮件提醒*/
        emailMsg = "非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。";
        CibrSysEmail userEmail = emailService.createCibrSysEmail(registerEmail, emailMsg, Util.USER_CREATE);
        emailService.sendMail(userEmail);
        userMapper.insert(user);
    }
}
