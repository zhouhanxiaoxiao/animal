package com.cibr.animal.demo.util;

import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

public class Util {

    /** 审核人 */
    public static final String ROLE_TYPE_REVIEWER = "40";

    /** 实验协助 */
    public static final String ROLE_TYPE_SUPPORTER = "03";

    /** 其他 */
    public static final String ROLE_TYPE_OTHER = "09";

    /** 其他 */
    public static final String ROLE_TYPE_ADMIN = "999999";

    /** 实验员 */
    public static final String ROLE_TYPE_EXPER = "01";

    public static final String EMAIL_SUB_VERCODE = "验证码";

    public static final String EMAIL_SUB_ASKTASK = "使用申请";

    public static final String EMAIL_SUB_OVERTIME = "超时提醒";

    public static final String EMAIL_SUB_SUGGEST = "suggest";

    public static final String USER_CREATE = "用户账号申请";

    public static final String EMAIL_PREFIX = "【北京脑科学与类脑研究中心】\n\n\t";

    public static final String EMAIL_SUFFIX = "\n\n\n感谢您使用资源管理平台(http://119.90.33.35:3566/)！";

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
                + "】";
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

    public static String nullToStr(Object str){
        if (str == null){
            return "";
        }else {
            return String.valueOf(str);
        }
    }

    public static String statuFlag(String statu){
        switch (statu){
            case "01":
            case "00":
                return "已保存";
            case "02":
                return "已提交";
            case "09":
                return "已终止";
            default:
                return null;
        }
    }

    /**
     * 获取性别
     * @param flag
     * @return
     */
    public static String isMale(String flag){
        if ("雄性".equals(flag)){
            return "male";
        }else if ("雌性".equals(flag)){
            return "female";
        }else {
            return "empty";
        }
    }

    /**
     * 转换是否
     * @param flag
     * @return
     */
    public static String yesOrNo(String flag){
        if ("是".equals(flag)){
            return "Y";
        }else {
            return "N";
        }
    }

    public static String getSelfNum(String sampleInit,String sampleType,String databaseType){
        if (
                "01".equals(sampleType)
                ||"03".equals(sampleType)
                ||"04".equals(sampleType)
        ){
            /*DNA：ND（DNA）+19（年）+01（月）+00001（流水）
	        例如：ND190100001，代表2019年1月第1个DNA样品。*/
            return "ND";
        }else if (
                "02".equals(sampleType)
        ){
             /*RNA：NR（RNA）+19（年）+01（月）+0001（流水）
	            例如：NR190100001，代表2019年1月第1个RNA样品。*/
            return "NR";
        }else if (
                "01".equals(databaseType)
                ||"02".equals(databaseType)
                ||"03".equals(databaseType)
                ||"04".equals(databaseType)
        ){
            /*DNA：ND（DNA）+19（年）+01（月）+00001（流水）
	        例如：ND190100001，代表2019年1月第1个DNA样品。*/
            return "ND";
        }else if (
                "05".equals(databaseType)
                ||"06".equals(databaseType)
                ||"07".equals(databaseType)
        ){
            /*DNA：ND（DNA）+19（年）+01（月）+00001（流水）
	        例如：ND190100001，代表2019年1月第1个DNA样品。*/
            return "NR";
        }else if (
                "21".equals(databaseType)
                ||"22".equals(databaseType)
                ||"23".equals(databaseType)
                ||"24".equals(databaseType)
                ||"25".equals(databaseType)
                ||"31".equals(databaseType)
                ||"32".equals(databaseType)
                ||"33".equals(databaseType)
        ){
            return "NRO";
        }else if (
                "26".equals(databaseType)
                ||"27".equals(databaseType)
                ||"28".equals(databaseType)
                ||"29".equals(databaseType)
                ||"30".equals(databaseType)
        ){
            return "NDO";
        }else if (
                "41".equals(databaseType)
                ||"42".equals(databaseType)
                ||"43".equals(databaseType)
                ||"44".equals(databaseType)
                ||"45".equals(databaseType)
        ){
            return "NC";
        }
        return null;
    }

    public static String getTransformIndex(String sampletype,String databaseType){
        switch (sampletype){
            case "01":
                switch (databaseType){
                    case "05":
                    case "06":
                    case "07":
                    case "21":
                    case "22":
                    case "23":
                    case "24":
                    case "25":
                    case "31":
                    case "32":
                    case "33":
                        return "ZNR";
                    case "01":
                    case "02":
                    case "03":
                    case "04":
                    case "26":
                    case "27":
                    case "28":
                    case "29":
                    case "30":
                        return "ZND";
                    default:
                        return null;
                }
            case "03":
                return "ZNC";
            default:
                return null;
        }
    }
}
