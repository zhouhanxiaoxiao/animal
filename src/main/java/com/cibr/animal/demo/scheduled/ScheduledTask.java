package com.cibr.animal.demo.scheduled;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class ScheduledTask {

    public static final int ONE_HOUR = 1000 * 60 * 60;

    public static final int HALF_HOUR = 1000 * 60 * 60;

    @Autowired
    ScheduleHandle handle;
    /**
     * 半个个小时执行一次
     */
    @Scheduled(fixedRate = ONE_HOUR)
    public void scheduledTask() {
        System.out.println("任务执行时间：" + LocalDateTime.now());
        /*查看协助申请，是否有超过一个小时未确定的。*/
        handle.checkPartnerTask();
    }

    /**
     * 每天凌晨1点执行一次
     */
    @Scheduled(cron = "0 0 1 * * ?")
    public void time1(){
        handle.checkThreeWeekStock();
    }
}
