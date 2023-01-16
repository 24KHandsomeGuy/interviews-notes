package com.bibabo.thread.artofconcurrentprogramming.lock;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/1/11 10:47
 * @Description:
 */
public class NonFairAndFairLockTest2 {

    private static final ReentrantLock2 fairLock = new ReentrantLock2(true);
    private static final ReentrantLock2 nonFairLock = new ReentrantLock2(false);

    private static final class MyWorkThread implements Runnable {

        private ReentrantLock2 lock;

        private Integer loopTimes;

        private CountDownLatch countDownLatch;

        public MyWorkThread(ReentrantLock2 lock, Integer loopTimes, CountDownLatch countDownLatch) {
            this.lock = lock;
            this.loopTimes = loopTimes;
            this.countDownLatch = countDownLatch;
        }

        @Override
        public void run() {
            for (int i = 0; i < loopTimes; i++) {
                lock.lock();
                // System.out.println("acquired lock thread is : " + Thread.currentThread().getName() + ", Waiting thread are:" + lock.getQueuedThreads());
                lock.unlock();
                countDownLatch.countDown();
            }
        }
    }

    private static class ReentrantLock2 extends ReentrantLock {

        public ReentrantLock2(boolean fair) {
            super(fair);
        }

        @Override
        public Collection<Thread> getQueuedThreads() {
            List<Thread> arrayList = new ArrayList<>(super.getQueuedThreads());
            Collections.reverse(arrayList);
            return arrayList;
        }
    }

    public static void main(String[] args) throws InterruptedException {
        CountDownLatch countDownLatch = new CountDownLatch(10 * 100000);
        long start = System.currentTimeMillis();
        for (int i = 0; i < 10; i++) {
            new Thread(new MyWorkThread(fairLock, 100000, countDownLatch), "T-" + i).start();// result: 6375ms
            // new Thread(new MyWorkThread(nonFairLock, 100000, countDownLatch), "T-" + i).start();// result: 43ms
        }
        countDownLatch.await();
        long end = System.currentTimeMillis();
        System.out.println(end - start);
    }

}
