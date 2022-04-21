package com.bibabo.thread;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author fukuixiang
 * @date 2021/3/25
 * @time 11:10
 * @description
 */
public class CheckMaxThreadNums {

    static volatile boolean runFlag = true;

    public static void main(String[] args) throws InterruptedException {

        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(10000, 300000, 5, TimeUnit.SECONDS, new LinkedBlockingQueue<>(3000));

        final AtomicInteger atomicInteger = new AtomicInteger();

        new Thread(() -> {
            while (runFlag) {
                threadPoolExecutor.submit(() -> {
                    try {
                        System.out.println(atomicInteger.incrementAndGet());
                        TimeUnit.SECONDS.sleep(10);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                });
            }
        }).start();

        TimeUnit.SECONDS.sleep(5);
        runFlag = false;

        TimeUnit.SECONDS.sleep(20);
        threadPoolExecutor.shutdown();
    }

}
