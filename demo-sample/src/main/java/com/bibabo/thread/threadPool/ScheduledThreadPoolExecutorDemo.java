package com.bibabo.thread.threadPool;

import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/8/13
 * @time 16:09
 * @description
 */
public class ScheduledThreadPoolExecutorDemo {

    private static final int CPU_CNT = Runtime.getRuntime().availableProcessors();//机器的cpu核数
    public static ScheduledExecutorService executor = new ScheduledThreadPoolExecutor(CPU_CNT);

    public static void main(String[] args) throws InterruptedException {
        System.out.println("CPU个数：" + CPU_CNT);

        for (int i = 0; i < 1;i ++) {
            executor.schedule(new Task(1), 15, TimeUnit.SECONDS);
        }

        Thread.sleep(100000);
        executor.shutdown();
    }

    public static class Task implements Runnable {

        private int result;

        public int getResult() {
            return result;
        }

        public void setResult(int result) {
            this.result = result;
        }

        public Task(int result) {
            this.result = result;
        }

        @Override
        public void run() {
            System.out.println("结果:" + result);
            if (result > 10) {
                return;
            }
            this.setResult(++ result);
        }
    }
}
