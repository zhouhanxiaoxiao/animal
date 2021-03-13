package com.cibr.animal.demo.scheduled;

import com.cibr.animal.demo.util.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;

@Component
public class ScheduledTask {

    public static final int SIX_HOUR = 1000 * 60 * 60 * 6;

    public static final int HALF_HOUR = 1000 * 60 * 60;

    @Autowired
    ScheduleHandle handle;
    /**
     * 半个个小时执行一次
     */
    @Scheduled(fixedRate = SIX_HOUR)
    public void scheduledTask() {
        System.out.println("任务执行时间：" + LocalDateTime.now());
//        handle.checkPartnerTask();
        handle.chceckStockIsLow5();
    }

    /**
     * 每天凌晨1点执行一次
     */
    @Scheduled(cron = "0 0 1 * * ?")
    public void time1(){
        System.out.println("任务执行时间：" + LocalDateTime.now());
        handle.checkThreeWeekStock();
        /*查看协助申请，是否有超过一个小时未确定的。*/
        handle.checkPartnerTask();
    }

    /**
     * 每月
     */
    @Scheduled(cron = "0 0 1 1 * ?")
    public void billCreate() throws Exception {
        Date now = new Date();
        Date date = TimeUtil.dateAdd(now, Calendar.DATE, -1);
        String currMonth = TimeUtil.date2str(date,"yyyy-MM");
        handle.makeBill(currMonth, "system");
    }
}
