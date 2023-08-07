package com.bibabo.date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeDiff {

    public static void main(String[] args) throws ParseException {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date2 = sdf.parse("2023-05-31 12:48:00");
        System.out.println((date.getTime() - date2.getTime()) / 1000/ 60);

    }
}
