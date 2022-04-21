package com.bibabo.demo;

import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class TestScheduledThraedPool {

    public static void main(String[] args) {

        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1);
        scheduledThreadPoolExecutor.scheduleAtFixedRate(new ThreadDemo(scheduledThreadPoolExecutor),0,5, TimeUnit.SECONDS);



    }

    private static class ThreadDemo extends Thread {
        int i = 0;
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor;
        public ThreadDemo (ScheduledThreadPoolExecutor scheduledThreadPoolExecutor) {
            this.scheduledThreadPoolExecutor = scheduledThreadPoolExecutor;
        }

        @Override
        public void run() {
            i ++;
            if (i == 3)
                scheduledThreadPoolExecutor.shutdown();
            System.out.println(111);
        }
    }
}
