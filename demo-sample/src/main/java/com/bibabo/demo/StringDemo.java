package com.bibabo.demo;

/**
 * @author fukuixiang
 * @date 2020/12/29
 * @time 14:19
 * @description
 */
public class StringDemo {

    public static void main(String[] args) {

        String s = "abcdefg";

        /*String[] ss = s.split(",");

        System.out.println(ss);*/
        System.out.println(s.length() > 10 ? s.substring(0, 10) : s);

    }

}
