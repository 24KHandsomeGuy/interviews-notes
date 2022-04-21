package com.bibabo.thread;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author fukuixiang
 * @date 2021/3/11
 * @time 12:41
 * @description
 */
public class DeadLock {

    public static void main(String[] args) {

        Lock lock1 = new ReentrantLock();
        Lock lock2 = new ReentrantLock();

        new Thread(() -> {
            lock1.lock();
            try {
                TimeUnit.SECONDS.sleep(3);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            lock2.lock();
            try {

            } finally {
                lock1.unlock();
                lock2.unlock();
            }
        }).start();

        new Thread(() -> {
            Thread.yield();
            lock2.lock();
            lock1.lock();

            try {

            } finally {
                lock2.unlock();
                lock1.unlock();
            }
        }).start();

    }

}
