package com.bibabo.assertdemo;

/**
 * @author fukuixiang
 * @date 2021/1/26
 * @time 18:52
 * @description
 * IDEA中默认assert(断言)是关闭，开启方式如下：
 * 简单来说：就是设置一下jvm的参数，参数是-enableassertions或者-ea（推荐）
 *
 * assert [boolean 表达式 : 错误表达式 （日志）]
 */
public class AssertDemo {

    public static void main(String[] args) {
        int a = 1;
        int b = 2;
        // 格式1：assert [boolean 表达式]
        assert a > b : "a不大于b";
        System.out.println("a大于b");
    }
}
