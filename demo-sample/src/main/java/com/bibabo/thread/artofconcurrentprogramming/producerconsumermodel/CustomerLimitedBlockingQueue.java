package com.bibabo.thread.artofconcurrentprogramming.producerconsumermodel;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/22 17:24
 * @Description: 借鉴LinkedBlockingQueue
 */
public class CustomerLimitedBlockingQueue<T> {

    private Object[] elements;

    private int addIndex, removeIndex;

    private AtomicInteger count = new AtomicInteger(0);

    private Object takeLock = new Object();

    private Object putLock = new Object();

    public CustomerLimitedBlockingQueue(int count) {
        this.elements = new Object[count];
    }

    public void put(T t) throws InterruptedException {

        int c = -1;
        synchronized (putLock) {
            while (count.get() == elements.length) {
                putLock.wait();
            }
            elements[addIndex] = t;
            if (++addIndex == elements.length) {
                addIndex = 0;
            }
            c = count.getAndIncrement();
        }
        synchronized (takeLock) {
            takeLock.notify();
        }
    }


    public T take() throws InterruptedException {

        int c = -1;
        Object e;
        synchronized (takeLock) {
            while (count.get() == 0) {
                takeLock.wait();
            }
            // FIFO
            e = elements[removeIndex];
            elements[removeIndex] = null;
            if (++removeIndex == elements.length) {
                removeIndex = 0;
            }
            c = count.getAndDecrement();
        }
        synchronized (putLock) {
            putLock.notify();
        }
        return (T) e;
    }

    public int getCount() {
        return count.get();
    }
}
