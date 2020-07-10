package com.cibr.animal.demo.util;

import java.util.Random;
import java.util.UUID;

public class Util {

    public static final String EMAIL_SUB_VERCODE = "验证码";

    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-","");
    }

    public static String getVerificationTemplate(String code){
        return "【北京脑科学与类脑研究中心】验证码是：" + code + "，有效期为1小时，欢迎您使用资源管理平台！";
    }

    public static int getVerificationCode(){
        Random r = new Random();
        return r.nextInt(900000)+100000;
    }

    public static String getVerificationMsg(){
        return getVerificationTemplate(String.valueOf(getVerificationCode()));
    }
}
