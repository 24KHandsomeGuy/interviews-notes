package com.bibabo.thread.artofconcurrentprogramming;

import lombok.SneakyThrows;

import java.util.concurrent.TimeUnit;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/22 14:46
 * @Description:
 */
public class DaemonDemo {

    public static void main(String[] args) {
        Thread thread = new Thread(new DaemonRunner(), "DaemonRunner");
        thread.setDaemon(true);
        thread.start();
    }
    static class DaemonRunner implements Runnable {
        @SneakyThrows
        @Override
        public void run() {
            try {
                TimeUnit.SECONDS.sleep(10);
            } finally {
                // 当进程中所有非Daemon线程全部执行结束时，Daemon线程并不会执行finally里的代码
                System.out.println("DaemonThread finally run.");
            }
        }
    }

}
