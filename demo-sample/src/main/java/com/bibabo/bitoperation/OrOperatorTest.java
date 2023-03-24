package com.bibabo.bitoperation;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/17 16:00
 * @Description:
 */
public class OrOperatorTest {

    public static void main(String[] args) {
        long start = System.nanoTime();
        int num = 15;
        for (int i = 0; i < Integer.MAX_VALUE; i++) {
            // int rst = i % num;// 2464900纳秒
            int rst = i & num;// 1805100纳秒
        }
        long end = System.nanoTime();
        System.out.println(end - start);
    }
}
