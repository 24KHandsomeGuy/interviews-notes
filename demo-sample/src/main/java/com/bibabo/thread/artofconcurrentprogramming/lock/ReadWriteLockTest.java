package com.bibabo.thread.artofconcurrentprogramming.lock;

import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/1/4 18:25
 * @Description: 非同线程。
 * 加了读锁就不可以加写锁
 * 加了写锁就不可以加读锁
 * 同线程。
 * 加了读锁就不可以加写锁
 * 加了写锁可以加读锁
 * <p>
 * 核心算法：仍使用state标记锁状态，低16位记录独占锁，高16位及向上记录共享锁
 */
public class ReadWriteLockTest {

    private static final Map<String, Condition> conditionMap = new java.util.concurrent.ConcurrentHashMap<>();

    public static void main(String[] args) throws InterruptedException {
        ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
        Lock writeLock = readWriteLock.writeLock();
        Lock readLock = readWriteLock.readLock();
        readLock.lock();
        conditionMap.putIfAbsent("aaa", readLock.newCondition());
        readLock.unlock();

        for (int i = 0; i < 10; i++) {
            new Thread(() -> {
                boolean lockrst = false;
                try {
                    lockrst = writeLock.tryLock();
                    if (lockrst) {
                        Condition condition = conditionMap.get("aaa");
                        // 读库写redis
                        TimeUnit.SECONDS.sleep(1);
                        System.out.println("写缓存成功，唤醒读线程");
                        condition.signalAll();
                    } else {
                        readLock.lock();
                        Condition condition = conditionMap.get("aaa");
                        System.out.println(Thread.currentThread().getName() + "阻塞等待读线程唤醒");
                        boolean awaitRst = condition.await(2000, TimeUnit.MILLISECONDS);
                        if (!awaitRst) {
                            return;
                        } else {
                            // 读redis
                            System.out.println("redis hangzai");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (lockrst) {
                        writeLock.unlock();
                    }
                    try {
                        readLock.unlock();
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    } finally {
                        System.out.println("释放锁");
                    }
                }
            }).start();
        }

    }
}
