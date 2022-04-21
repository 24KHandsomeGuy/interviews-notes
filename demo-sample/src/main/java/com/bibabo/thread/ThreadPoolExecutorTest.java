package com.bibabo.thread;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2020/12/8
 * @time 11:23
 * @description
 */
public class ThreadPoolExecutorTest {


    public static void main(String[] args) {

        ExecutorService executor = Executors.newSingleThreadExecutor();
        ExecutorService executor2 = Executors.newCachedThreadPool();
        ExecutorService executor3 = Executors.newFixedThreadPool(10);
        ExecutorService executor4 = Executors.newScheduledThreadPool(5);
        executor.shutdown();executor2.shutdown();executor3.shutdown();executor4.shutdown();

        int cpuSize = Runtime.getRuntime().availableProcessors();
        System.out.println(cpuSize);
        ThreadPoolExecutor poolExecutor = new ThreadPoolExecutor(cpuSize + 1, cpuSize * 2, 3000, TimeUnit.MILLISECONDS, new ArrayBlockingQueue<>(50));
        poolExecutor.execute(() -> {
            System.out.println("hello thread-demo1");
        });
        poolExecutor.execute(() -> {
            System.out.println("hello thread-demo1");
        });
        poolExecutor.execute(() -> {
            System.out.println("hello thread-demo1");
        });
        poolExecutor.execute(() -> {
            System.out.println("hello thread-demo1");
        });
        poolExecutor.shutdown();
    }

}
