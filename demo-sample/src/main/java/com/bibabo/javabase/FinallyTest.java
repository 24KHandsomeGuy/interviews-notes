package com.bibabo.javabase;

/**
 * @author fukuixiang
 * @date 2021/1/20
 * @time 14:57
 * @description
 */
public class FinallyTest {

    public static void main(String[] args) {

        System.out.println(test());

    }

    private static boolean test() {
        try {
            return 2200 == 1 / 0;
            // return 2200 == 2100;
        } catch (RuntimeException e) {
            System.out.println("错误" + e.getMessage());
            return true;
        } finally {
            return false;
        }
    }

}
