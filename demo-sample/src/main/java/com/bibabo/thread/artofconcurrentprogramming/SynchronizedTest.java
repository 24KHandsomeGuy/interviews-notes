package com.bibabo.thread.artofconcurrentprogramming;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 14:36
 * @Description:
 */
public class SynchronizedTest {

    public static void main(String[] args) {
        synchronized (SynchronizedTest.class) {
        }
        m();
    }

    public static synchronized void m() {
    }
}
