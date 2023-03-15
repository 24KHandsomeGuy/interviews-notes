package com.bibabo.jvm;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/2 18:08
 * @Description:
 */
public class StackOutOfMemoryTest {

    public static void main(String[] args) {
        while (true) {
            new Thread(()-> System.out.println(1)).start();
        }
    }
}
