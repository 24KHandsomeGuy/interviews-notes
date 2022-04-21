package com.bibabo.jvm;


import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/19
 * @time 15:24
 * @description
 */
public class StackOverFlowErrorTest {

    public static void main(String[] args) throws InterruptedException {
        stackOverFlow();

    }

    public static void stackOverFlow() throws InterruptedException {
        TimeUnit.MILLISECONDS.sleep(1);
        stackOverFlow();
    }

}
