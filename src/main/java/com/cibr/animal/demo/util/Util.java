package com.cibr.animal.demo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

public class Util {

    public static final String EMAIL_SUB_VERCODE = "验证码";

    public static final String EMAIL_SUB_ASKTASK = "使用申请";

    public static final String USER_CREATE = "用户账号申请";

    public static final String EMAIL_PREFIX = "【北京脑科学与类脑研究中心】\n\n\t";

    public static final String EMAIL_SUFFIX = "\n\n\n感谢您使用资源管理平台！";

    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-","");
    }

    public static String getVerificationTemplate(String code){
        return EMAIL_PREFIX + "验证码是：" + code + "，有效期为1小时。" + EMAIL_SUFFIX;
    }

    /**
     * 获取申请任务邮件模板
     * @param map
     * @return
     */
    public static String getAskTaskTemplate(Map<String,Object> map){
        String msg = EMAIL_PREFIX + "您有一个【申请使用任务】待处理，申请人【" + String.valueOf(map.get("creater"))
                + "】，预计实验时间【" + String.valueOf(map.get("expectedTime")) + "】";
        if ("1".equals(String.valueOf(map.get("urgent")))){
            msg += ",任务申请【！！！加急！！！】";
        }
        msg += "，请及时处理。" + EMAIL_SUFFIX;
        return msg;
    }

    /**
     * 获取验证码
     * @return
     */
    public static int getVerificationCode(){
        Random r = new Random();
        return r.nextInt(900000)+100000;
    }

    /**
     * 获取验证码模板
     * @return
     */
    public static String getVerificationMsg(){
        return getVerificationTemplate(String.valueOf(getVerificationCode()));
    }

    public static Date str2date(String dateStr,String format) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        Date date = sdf.parse(dateStr);
        return date;
    }
}
