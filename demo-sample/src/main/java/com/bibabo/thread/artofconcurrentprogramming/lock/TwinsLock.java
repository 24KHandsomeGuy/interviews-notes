package com.bibabo.thread.artofconcurrentprogramming.lock;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.AbstractQueuedSynchronizer;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/1/10 16:43
 * @Description: 为加深AQS理解，自定义一个双胞胎锁，同一时刻是能有两个线程同时获取到锁
 */
public class TwinsLock implements Lock {

    public static void main(String[] args) throws InterruptedException {
        TwinsLock twinsLock = new TwinsLock();
        int num = 10;
        CountDownLatch countDownLatch = new CountDownLatch(num);
        List<Thread> threadList = new ArrayList<>();
        for (int i = 0; i < num; i++) {
            Thread thread = new Thread(() -> {
                twinsLock.lock();
                System.out.println(Thread.currentThread().getName() + " has acquired the lock.");
                try {
                    TimeUnit.SECONDS.sleep(10);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                twinsLock.unlock();
            }, "Thread-" + i);
            threadList.add(thread);
            countDownLatch.countDown();
        }
        countDownLatch.await();
        threadList.forEach(Thread::start);
    }

    private final Sync sync = new Sync(2);

    private static final class Sync extends AbstractQueuedSynchronizer {

        Sync(int count) {
            if (count <= 0) {
                throw new IllegalArgumentException("Count must large than zero.");
            }
            setState(count);
        }

        @Override
        protected int tryAcquireShared(int arg) {
            for (; ; ) {
                int current = getState();
                int newCount = current - arg;
                if (newCount < 0 || compareAndSetState(current, newCount)) {
                    return newCount;
                }
            }
        }

        @Override
        protected boolean tryReleaseShared(int arg) {
            for (; ; ) {
                int current = getState();
                int newCount = current + arg;
                if (compareAndSetState(current, newCount)) {
                    return true;
                }
            }
        }
    }

    @Override
    public void lock() {
        sync.acquireShared(1);
    }

    @Override
    public void unlock() {
        sync.releaseShared(1);
    }


    // 以下先忽略
    @Override
    public void lockInterruptibly() throws InterruptedException {
        throw new UnsupportedOperationException();
    }

    @Override
    public boolean tryLock() {
        throw new UnsupportedOperationException();
    }

    @Override
    public boolean tryLock(long time, TimeUnit unit) throws InterruptedException {
        throw new UnsupportedOperationException();
    }

    @Override
    public Condition newCondition() {
        throw new UnsupportedOperationException();
    }
}
