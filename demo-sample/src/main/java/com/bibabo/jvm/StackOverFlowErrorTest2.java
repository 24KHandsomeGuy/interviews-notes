package com.bibabo.jvm;

import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/19
 * @time 15:24
 * @description
 */
public class StackOverFlowErrorTest2 extends Thread {

    static int count;

    public static void main(String[] args) throws InterruptedException {
        int i = 0;
        while (i ++ < 10) {
            TimeUnit.SECONDS.sleep(1);
            new StackOverFlowErrorTest2().start();
        }
    }

    public void stackOverFlow() {
        count ++;
        System.out.println(count);
        while (true) {

        }
    }

    @Override
    public void run() {
        stackOverFlow();
    }
}
