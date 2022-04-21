package com.bibabo.demo;

/**
 * @author fukuixiang
 * @date 2020/11/26
 * @time 11:49
 * @description
 */
public class StringTest2 {

    public static void main(String[] args) {

        String ss = "aaa/bbb/ccc";
        System.out.println(ss.substring(ss.lastIndexOf("/") + 1, ss.length()));


    }

}
