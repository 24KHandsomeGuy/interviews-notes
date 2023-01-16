package com.bibabo.thread.lockQueue;

import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author fukuixiang
 * @date 2021/3/15
 * @time 11:14
 * @description 是有问题的 if (blockingQueue.peek() == null) { 换成 while (blockingQueue.peek() == null) {
 */
@Deprecated
public class MyBlockingQueue<E> {

    Queue<E> blockingQueue = new LinkedList<>();

    ReentrantLock reentrantLock = new ReentrantLock();

    Condition condition = reentrantLock.newCondition();

    void add(E e) {
        reentrantLock.lock();
        try {
            blockingQueue.offer(e);
            condition.signalAll();
        } finally {
            reentrantLock.unlock();
        }
    }

    E take() {
        reentrantLock.lock();
        try {
            if (blockingQueue.peek() == null) {
                condition.await();
            }
            return blockingQueue.poll();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            reentrantLock.unlock();
        }
        return null;
    }

}
