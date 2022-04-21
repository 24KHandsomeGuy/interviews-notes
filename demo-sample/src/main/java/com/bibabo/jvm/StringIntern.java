package com.bibabo.jvm;

/**
 * @author fukuixiang
 * @date 2021/3/19
 * @time 16:01
 * @description
 */
public class StringIntern {

    public static void main(String[] args) {

        String a = new String("a");

        String aa = "a";

        System.out.println(a.intern() == aa.intern());


    }

}
