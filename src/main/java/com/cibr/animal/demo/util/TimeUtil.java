package com.cibr.animal.demo.util;

import java.util.Calendar;
import java.util.Date;

public class TimeUtil {

    public static Date dateAdd(Date date, int conf,int num){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(conf,num);
        return calendar.getTime();
    }
}
