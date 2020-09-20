package com.cibr.animal.demo.util.exception;

public class CommonException extends RuntimeException{

    private String errCode;

    private String errMsg;

    public CommonException(String message){
        super(message);
        this.errMsg = message;
    }

    public String getErrCode() {
        return errCode;
    }

    public void setErrCode(String errCode) {
        this.errCode = errCode;
    }

    public String getErrMsg() {
        return errMsg;
    }

    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }
}
