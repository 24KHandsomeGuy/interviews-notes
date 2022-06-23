package com.bibabo.thread.artofconcurrentprogramming.lock;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/23 7:24
 * @Description:
 */
public class ReentrantLockDemo {

    public static void main(String[] args) {
        Lock lock = new ReentrantLock();

        new Thread(() -> {
            lock.lock();
            try {
                Thread.sleep(60000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            lock.unlock();
        }, "Thread-1").start();

        new Thread(() -> {
            lock.lock();
            System.out.println(Thread.currentThread().getName() + "required lock");
            lock.unlock();
        }, "Thread-2").start();

    }
}
