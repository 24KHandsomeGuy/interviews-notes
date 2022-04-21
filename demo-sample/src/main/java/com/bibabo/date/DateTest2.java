package com.bibabo.date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * @author fukuixiang
 * @date 2020/7/13
 * @time 17:00
 * @description
 */
public class DateTest2 {

    public static void main(String[] args) throws ParseException {


        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date earliestDeliverDateFormate = sdf.parse("2021-03-28 00:00:00".substring(0, 10));

        Date latestDeliverDateFormate = sdf.parse("2021-03-30 00:00:00".substring(0, 10));

        Date bookDate = sdf.parse("2021-03-29 00:00:00".substring(0, 10));

        System.out.println(bookDate.before(earliestDeliverDateFormate));

        System.out.println(bookDate.after(latestDeliverDateFormate));

        /*Date date = new Date();
        Date bookDate1 = addDay(date, 1);
        System.out.println(bookDate1);

        Date bookDate2 = addDay(date, 1);
        System.out.println(bookDate2);*/

    }

    public static Date addDay(Date date, int n) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(5, n);
        date = calendar.getTime();
        return date;
    }

}
