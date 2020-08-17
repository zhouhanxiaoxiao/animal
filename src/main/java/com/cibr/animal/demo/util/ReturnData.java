package com.cibr.animal.demo.util;

import java.util.Map;

public class ReturnData {
    /**
     *   200-处理成功
     *   E500-处理失败
     *   ---注册页面
     *   E501-该邮箱已注册，请等待管理员审核！
     *   E502-该邮箱已注册！
     *   E503-验证码校验不通过！
     *   E504-验证码已过期，请重新发送！
     *   E505-邮箱不存在
     *   ---登录页面
     *   E511-密码错误！.
     *   E510-用户不存在
     *
     *
     */
    String code;
    Map retMap;
    String errMsg;

    public String getErrMsg() {
        return errMsg;
    }

    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Map getRetMap() {
        return retMap;
    }

    public void setRetMap(Map retMap) {
        this.retMap = retMap;
    }
}
