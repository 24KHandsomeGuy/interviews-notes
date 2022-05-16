package com.bibabo.empty;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/12 16:45
 * @Description:
 */
public class ForTest {

    public static void main(String[] args) {
        out : while (true) {
            for (int i = 0; i < 100;i ++) {
                System.out.println(i);
                if (i == 10) {
                    break out;
                }
            }
        }


    }
}
