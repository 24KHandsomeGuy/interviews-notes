package com.bibabo.thread.artofconcurrentprogramming.lock;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/1/11 10:47
 * @Description:
 */
public class NonFairAndFairLockTest {

    private static final ReentrantLock2 fairLock = new ReentrantLock2(true);
    private static final ReentrantLock2 nonFairLock = new ReentrantLock2(false);

    private static final class MyWorkThread implements Runnable {

        private ReentrantLock2 lock;

        private Integer loopTimes;

        public MyWorkThread(ReentrantLock2 lock, Integer loopTimes) {
            this.lock = lock;
            this.loopTimes = loopTimes;
        }

        @Override
        public void run() {
            for (int i = 0; i < loopTimes; i++) {
                lock.lock();
                System.out.println("acquired lock thread is : " + Thread.currentThread().getName() + ", Waiting thread are:" + lock.getQueuedThreads());
                lock.unlock();
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
        for (int i = 0; i < 5; i++) {
            // new Thread(new MyWorkThread(fairLock, 10), "T-" + i).start();
            new Thread(new MyWorkThread(nonFairLock, 10), "T-" + i).start();
        }

        TimeUnit.SECONDS.sleep(10);
    }

}
