package com.bibabo.integer;

import org.apache.commons.lang3.time.DateUtils;

import java.util.Calendar;
import java.util.Date;

/**
 * @author fukuixiang
 * @date 2022/1/26
 * @time 17:02
 * @description
 */
public class FloatTest {

    private static final float f = 0x0.000002P-126f;


    public static void main(String[] args) {

        Date tomorrow = DateUtils.truncate(DateUtils.addDays(new Date(), 1), Calendar.DATE);
        System.out.println(tomorrow);
        Date date = DateUtils.addSeconds(tomorrow, -(960 * 60));
        System.out.println(date);
    }
}
