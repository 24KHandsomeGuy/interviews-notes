package com.bibabo.thread.threadPool.rejectpolicy;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/28 16:28
 * @Description
 */
public class RejectPolicyTest {

    // print log policy
    // private static final ThreadPoolExecutor executor = new ThreadPoolExecutor(1, 1, 0, TimeUnit.SECONDS, new ArrayBlockingQueue<>(2), new PrintLogPolicy());
    // print log policy
    private static final ThreadPoolExecutor executor = new ThreadPoolExecutor(1, 1, 0, TimeUnit.SECONDS, new ArrayBlockingQueue<>(2), new ReportHeapStackInfoPolicy());


    static {
        int prestartCoreThreadCount = executor.prestartAllCoreThreads();
        System.out.println(prestartCoreThreadCount);
    }

    public static void main(String[] args) {
        for (int i = 0; i < 5; i++) {
            executor.execute(() -> {
                try {
                    TimeUnit.MILLISECONDS.sleep(200);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            });
        }
        executor.shutdown();
    }
}
