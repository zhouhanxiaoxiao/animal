package com.cibr.animal.demo.util;

public class TaskUtil {

    /*cibr_sys_task 任务类型*/
    /**任务类型：申请使用任务*/
    public static final String ASK_TASK = "02";

    /*任务名称*/
    public static final String ASK_TASK_DROSOPHILA = "果蝇使用申请任务";
    public static final String TASK_CREATE_USER = "用户注册任务";

    /**
     * _task_ 任务状态
     */
    /**任务状态：执行中*/
    public static final String TASK_STATU_UNDO = "00";
    /**任务状态：执行中*/
    public static final String TASK_STATU_TODO = "01";
    /**任务状态：成功*/
    public static final String TASK_STATU_SUCCESS = "02";
    /**任务状态：失败*/
    public static final String TASK_STATU_FAIL = "03";

    /*申请任务状态*/
    /**任务状态：待确认*/
    public static final String ASK_TASK_STATU_UNDO = "00";
    /**任务状态：饲养员已确认*/
    public static final String ASK_TASK_STATU_TODO = "01";
    /**任务状态：饲养员已确认*/
    public static final String ASK_TASK_STATU_CONFIRM = "02";
    /**任务状态：饲养员部分确认*/
    public static final String ASK_TASK_PART_CONFIRM = "03";
    /**任务状态：动物已准备好*/
    public static final String ASK_TASK_PREPARED = "04";
    /**任务状态：实验员已确认*/
    public static final String ASK_TASK_ASKER_CONFIRM = "05";
    /**任务状态：实验员已确认*/
    public static final String ASK_TASK_ASKER_PART_CONFIRM = "06";
    /**任务状态：实验员全部拒绝*/
    public static final String ASK_TASK_ASKER_ALL_REFUSE = "08";
    /**任务状态：饲养员拒绝*/
    public static final String ASK_TASK_STATU_FAIL = "09";

}
