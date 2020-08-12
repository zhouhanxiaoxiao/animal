package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysEmailMapper;
import com.cibr.animal.demo.entity.CibrSysEmail;
import com.cibr.animal.demo.util.Util;
import com.cibr.animal.demo.util.exception.EmailException;
import com.sun.mail.smtp.SMTPAddressFailedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

@Service
public class EmailService{

    @Autowired
    private CibrSysEmailMapper emailMapper;

    @Autowired
    private JavaMailSenderImpl mailSender;

    @Value("${spring.mail.username}")
    private String from;


    @Async
    public CibrSysEmail sendMail(CibrSysEmail mailVo) {
        try {
            //1.检测邮件
            checkMail(mailVo);
            //2.发送邮件
            sendMimeMail(mailVo);
            //3.保存邮件
            return saveMail(mailVo);
        } catch (Exception e) {
            mailVo.setEmailStatus("fail");
            if (e instanceof EmailException){
                mailVo.setEmailError("邮箱地址不存在！");
            }
            return saveMail(mailVo);
        }
    }
    //构建复杂邮件信息类
    private void sendMimeMail(CibrSysEmail mailVo) {
        try {
            //true表示支持复杂类型
            MimeMessageHelper messageHelper = new MimeMessageHelper(mailSender.createMimeMessage(), true);
            //邮件发信人从配置项读取
            mailVo.setEmailFrom(from);
            //邮件发信人
            messageHelper.setFrom(mailVo.getEmailFrom());
            //邮件收信人
            messageHelper.setTo(mailVo.getEmailTo().split(","));
            //邮件主题
            messageHelper.setSubject(mailVo.getEmailSubject());
            //邮件内容
            messageHelper.setText(mailVo.getEmailText());
            //抄送
            if (!StringUtils.isEmpty(mailVo.getEmailCc())) {
                messageHelper.setCc(mailVo.getEmailCc().split(","));
            }
            //密送
            if (!StringUtils.isEmpty(mailVo.getEmailBcc())) {
                messageHelper.setCc(mailVo.getEmailBcc().split(","));
            }
            //添加邮件附件
            if (mailVo != null && mailVo.getMultipartFiles() != null) {
                for(MultipartFile multipartFile : mailVo.getMultipartFiles()) {
                    messageHelper.addAttachment(multipartFile.getOriginalFilename(), multipartFile);
                }
            }
            //发送时间
            if (StringUtils.isEmpty(mailVo.getEmailSentdate())) {
                mailVo.setEmailSentdate(new Date());
                messageHelper.setSentDate(mailVo.getEmailSentdate());
            }
            //正式发送邮件
            mailSender.send(messageHelper.getMimeMessage());
            mailVo.setEmailStatus("ok");
        } catch (Exception e) {
            mailVo.setEmailStatus("fail");
            mailVo.setEmailError(e.getMessage());
            //发送失败
            throw new EmailException("邮件发送失败：" + e.getMessage());
        }
    }

    private void checkMail(CibrSysEmail mailVo) {
        if (StringUtils.isEmpty(mailVo.getEmailTo())) {
            throw new EmailException("邮件收信人不能为空");
        }
        if (StringUtils.isEmpty(mailVo.getEmailSubject())){
            throw new EmailException("邮件主题不能为空");
        }
        if (StringUtils.isEmpty(mailVo.getEmailText())) {
            throw new EmailException("邮件内容不能为空");
        }
    }

    public CibrSysEmail createCibrSysEmail(String emailTo, String emailText,String emailSubject) {
        CibrSysEmail email = new CibrSysEmail();
        email.setEmailId(Util.getUUID());
        email.setEmailFrom(from);
        email.setEmailTo(emailTo);
        email.setEmailText(emailText);
        email.setEmailSubject(emailSubject);
        email.setEmailSentdate(new Date());
        return email;
    }

    //保存邮件
    private CibrSysEmail saveMail(CibrSysEmail mailVo) {
        emailMapper.insert(mailVo);
        return mailVo;
    }

    public void simpleSendEmail(String context,String addr,String sub){
        CibrSysEmail cibrSysEmail = createCibrSysEmail(addr, context, sub);
        sendMail(cibrSysEmail);
    }

    public void simpleSendEmail(String context, List<String> addrs, String sub){
        for (String addr : addrs){
            CibrSysEmail cibrSysEmail = createCibrSysEmail(addr, context, sub);
            sendMail(cibrSysEmail);
        }
    }
}
