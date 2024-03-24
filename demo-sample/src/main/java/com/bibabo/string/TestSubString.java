package com.bibabo.string;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/17 14:54
 * @Description
 */
public class TestSubString {

    public static void main(String[] args) {
        String str1 = "/business/dcms/leader/page-schedule-publish/";
        String str2 = "/business/dcms/leader/page-schedule-publish/001";
        System.out.println(str2.substring(str1.lastIndexOf("/") + 1));
    }
}
