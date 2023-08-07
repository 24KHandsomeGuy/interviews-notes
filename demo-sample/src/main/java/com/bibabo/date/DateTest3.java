package com.bibabo.date;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/6/6 11:30:17
 * @Description
 */
public class DateTest3 {

    public static void main(String[] args) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(1686067199000L);
        Date date = calendar.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s = sdf.format(date.getTime());
        System.out.println(s);
    }
}
