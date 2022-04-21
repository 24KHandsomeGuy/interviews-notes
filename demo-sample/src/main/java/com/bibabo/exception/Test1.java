package com.bibabo.exception;

/**
 * @author fukuixiang
 * @date 2021/3/26
 * @time 14:46
 * @description
 */
public class Test1 {

    public static void main(String[] args) {

        System.out.println(testException());


    }

    private static String testException() {
        try {
            new RuntimeException("111");
            return "333";
        } finally {
            System.out.println(222);
        }
    }

}
