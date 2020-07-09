package com.cibr.animal.demo.util;

import java.util.Map;

public class ReturnData {
    //200-处理成功 500-处理失败
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
