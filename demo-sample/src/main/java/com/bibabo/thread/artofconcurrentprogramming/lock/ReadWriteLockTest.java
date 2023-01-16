package com.bibabo.thread.artofconcurrentprogramming.lock;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/1/4 18:25
 * @Description:
 * 非同线程。
 *         加了读锁就不可以加写锁
 *         加了写锁就不可以加读锁
 * 同线程。
 *         加了读锁就不可以加写锁
 *         加了写锁可以加读锁
 *
 * 核心算法：仍使用state标记锁状态，低16位记录独占锁，高16位及向上记录共享锁
 */
public class ReadWriteLockTest {

    public static void main(String[] args) {

        ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
        Lock writeLock = readWriteLock.writeLock();
        Lock readLock = readWriteLock.readLock();

        // 同线程，先写再读是可以的
        /*writeLock.lock();
        System.out.println("write lock successfully");
        readLock.lock();
        System.out.println("read lock successfully");*/

        // 同线程，先读再写是不可以的
        /*readLock.lock();
        System.out.println("read lock successfully");
        writeLock.lock();
        System.out.println("write lock successfully");*/

        readLock.lock();
        readLock.lock();
        readLock.lock();
    }
}
