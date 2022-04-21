package com.bibabo.demo;

import java.util.Calendar;
import java.util.Date;

/**
 * @author fukuixiang
 * @date 2021/5/27
 * @time 10:52
 * @description
 */
public class TimeTest {

    public static void main(String[] args) {

        Date date = new Date();
        Calendar calendar = Calendar.getInstance();

        calendar.set(Calendar.HOUR_OF_DAY, 21);
        Date date1 = calendar.getTime();
        System.out.println(date1);
        calendar.set(Calendar.HOUR_OF_DAY, 7);
        date1 = calendar.getTime();
        System.out.println(date1);

        calendar.add(Calendar.DATE, 1);
        System.out.println(calendar.getTime());
    }

}
