package com.bibabo.date;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author fukuixiang
 * @date 2020/7/13
 * @time 17:00
 * @description
 */
public class DateTest {

    public static void main(String[] args) {
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.add(Calendar.DATE,-13);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s = sdf.format(c.getTime());
        System.out.println(s);
    }

}
