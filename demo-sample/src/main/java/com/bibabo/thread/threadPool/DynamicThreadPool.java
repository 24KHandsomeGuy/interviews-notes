package com.bibabo.thread.threadPool;

import java.util.Random;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/27 17:30
 * @Description
 */
public class DynamicThreadPool {

    public static void main(String[] args) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(2, 2, 0, TimeUnit.SECONDS, new LinkedBlockingQueue<>());
        for (int i = 0 ; i < 100; i ++) {
            if (i == 10) {
                threadPoolExecutor.setCorePoolSize(10);
                threadPoolExecutor.setMaximumPoolSize(10);
            }
            if (i == 50) {
                threadPoolExecutor.setCorePoolSize(4);
                threadPoolExecutor.setMaximumPoolSize(4);
            }
            threadPoolExecutor.execute(() -> {
                try {
                    TimeUnit.SECONDS.sleep(new Random(10).nextInt());
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                System.out.println(Thread.currentThread().getName());
            });
            System.out.println(threadPoolExecutor.getPoolSize());
        }

        threadPoolExecutor.shutdown();
    }
}
