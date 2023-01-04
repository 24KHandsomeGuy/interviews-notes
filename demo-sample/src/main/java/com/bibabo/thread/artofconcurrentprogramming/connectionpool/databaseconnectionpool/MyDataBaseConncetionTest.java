package com.bibabo.thread.artofconcurrentprogramming.connectionpool.databaseconnectionpool;

import lombok.SneakyThrows;

import java.sql.Connection;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/10 12:51
 * @Description:
 */
public class MyDataBaseConncetionTest {


    @SneakyThrows
    public static void main(String[] args) {
        MyDataBaseConnectionPool connectionPool = new MyDataBaseConnectionPool(10);
        int threadCount = 50;
        AtomicLong gotCount = new AtomicLong();
        AtomicLong notGotCount = new AtomicLong();
        CountDownLatch startAtSameTime = new CountDownLatch(1);
        int oneThreadRunsTimes = 20;
        for (int i = 0; i < threadCount; i++) {
            Runner runner = new Runner(gotCount, notGotCount, startAtSameTime, connectionPool, oneThreadRunsTimes);
            new Thread(runner).start();
        }
        startAtSameTime.countDown();

        TimeUnit.SECONDS.sleep(10);
        System.out.println("Got connections count is " + gotCount.get() + ", didn`t get connections count is " + notGotCount.get());
        /**
         * if threadCount is 10 and oneTheadRunsTimes is 20, the result is ->
         *      Got connections count is 200, didn`t get connections count is 0
         * if threadCount is 20 and oneTheadRunsTimes is 20, the result is ->
         *      Got connections count is 389, didn`t get connections count is 11
         * if threadCount is 50 and oneTheadRunsTimes is 20, the result is ->
         *      Got connections count is 822, didn`t get connections count is 178
         */
    }


    private static class Runner implements Runnable {
        MyDataBaseConnectionPool connectionPool;
        AtomicLong gotCount;
        AtomicLong notGotCount;
        CountDownLatch startAtSameTime;
        int oneThreadRunsTimes;

        public Runner(AtomicLong gotCount, AtomicLong notGotCount, CountDownLatch startAtSameTime, MyDataBaseConnectionPool connectionPool, int oneThreadRunsTimes) {
            this.gotCount = gotCount;
            this.notGotCount = notGotCount;
            this.startAtSameTime = startAtSameTime;
            this.connectionPool = connectionPool;
            this.oneThreadRunsTimes = oneThreadRunsTimes;
        }

        @SneakyThrows
        @Override
        public void run() {
            // 等主线程把所有线程创建完毕，并发执行测试
            startAtSameTime.await();
            for (int i = 0; i < oneThreadRunsTimes; i++) {
                Connection connection = connectionPool.getConnection(1000);
                if (connection == null) {
                    notGotCount.incrementAndGet();
                } else {
                    gotCount.incrementAndGet();
                    connection.prepareStatement("select * from aaa");
                    connection.commit();
                    connectionPool.releaseConncetion(connection);
                }
            }
        }
    }
}
