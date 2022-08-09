package com.bibabo.integer;

/**
 * @author fukuixiang
 * @date 2020/6/4
 * @time 16:49
 * @description
 */
public class IntegerTest {

    public static void main(String[] args) {
        // true
        /*Integer i1 = 127;
        Integer i2 = 127;
        System.out.println(i1 == i2);*/

        // false
        /*Integer i1 = 10086;
        Integer i2 = 10086;
        System.out.println(i1 == i2);*/

        // true
        Integer i1 = 10086;
        Integer i2 = 10086;
        System.out.println(i1.intValue() == i2.intValue());
    }
}
