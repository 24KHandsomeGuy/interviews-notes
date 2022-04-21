package com.bibabo.demo;

import java.io.IOException;
import java.math.BigDecimal;

/**
 * @author fukuixiang
 * @date 2020/10/26
 * @time 17:27
 * @description
 */
public class BigDecimalTest {

    public static void main(String[] args) {

        BigDecimal bigDecimal = new BigDecimal(1.00);

        /*bigDecimal.setScale(2,BigDecimal.ROUND_HALF_UP);
        System.out.println(bigDecimal.doubleValue());*/

        bigDecimal = bigDecimal.divide(new BigDecimal(1000),3,BigDecimal.ROUND_HALF_UP);

        System.out.println(bigDecimal);

        String s = String.valueOf((char) 65);

        try {
            System.in.read();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
