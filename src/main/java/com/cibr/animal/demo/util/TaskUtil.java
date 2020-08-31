package com.cibr.animal.demo.util;

public class TaskUtil {

    /*cibr_sys_task 任务类型*/
    /**任务类型：注册申请*/
    public static final String REGISTER_TASK = "01";
    /**任务类型：申请使用任务*/
    public static final String ASK_TASK = "02";
    /**任务类型：流程管理任务*/
    public static final String PROCESS_TASK = "03";



    /*任务名称*/
    public static final String ASK_TASK_DROSOPHILA = "果蝇使用申请任务";
    public static final String TASK_CREATE_USER = "用户注册任务";
    public static final String TASK_PROCESS = "流程管理任务";

    /**
     * _task_ 任务状态
     */
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

    /**任务状态：样品录入*/
    public static final String PROCESS_TASK_STATU_SP = "10";
    /**任务状态：样品制备*/
    public static final String PROCESS_TASK_STATU_SPWAIT = "20";
    /**任务状态：文库制备*/
    public static final String PROCESS_TASK_STATU_LIB = "30";
    /**任务状态：测序分析*/
    public static final String PROCESS_TASK_STATU_DIS = "40";
    /**任务状态：生信分析*/
    public static final String PROCESS_TASK_STATU_BA = "50";
    /**任务状态：待创建者确认*/
    public static final String PROCESS_TASK_STATU_READY = "60";
}
