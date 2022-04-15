package com.bibabo.GOF23.flyweight.connection;

import GOF23.bridgeAdapter.Connection;

import java.lang.reflect.InvocationTargetException;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/2/25
 * @time 14:13
 * @description
 */
public class Test {

    public static void main(String[] args) throws InterruptedException {

        ThreadPoolExecutor executor = new ThreadPoolExecutor(100, 100, 3000, TimeUnit.MILLISECONDS, new LinkedBlockingQueue<>());
        for (int i = 0;i < 30;i ++) {
            executor.execute(new ConnectionTestThread());
        }

        Thread.sleep(2000);
        System.out.println("-----------------------------");
        for (int i = 0;i < 20;i ++) {
            executor.execute(new ConnectionTestThread());
        }

        Thread.sleep(2000);

        executor.shutdown();

    }

    private static class ConnectionTestThread implements Runnable {

        @Override
        public void run() {
            try {
                Connection conn = ConnectionPool.getConnection("mysql");
                if (conn == null) {
                    return;
                }
                conn.connect();
                conn.commit();
                TimeUnit.SECONDS.sleep(1);
                ConnectionPool.release(conn);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
