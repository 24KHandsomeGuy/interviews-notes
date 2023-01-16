package com.bibabo.thread.artofconcurrentprogramming.producerconsumermodel;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/22 17:24
 * @Description: 借鉴LinkedBlockingQueue
 */
public class CustomerLimitedBlockingQueue2<T> {

    private Object[] elements;

    private int addIndex, removeIndex;

    private AtomicInteger count = new AtomicInteger(0);

    private Object takeLock = new Object();

    private Object putLock = new Object();

    public CustomerLimitedBlockingQueue2(int count) {
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
            // 此处需要唤醒其他被阻塞的putLock线程
            if (c + 1 < elements.length) {// 加上本次后还小于length，需要唤醒
                putLock.notify();
            }
        }
        // Doug Lea大师的设计实在太巧妙了。相比于每一次都唤醒，每一次都需要获取第二把锁。
        // 这种方式，只需要在之前的数量等于0时（也就是之前有可能存在take线程阻塞时）才会唤醒，
        // 其余的唤醒将移步至上面的c + 1 < elements.length唤醒。
        // 做到了，除队列满，或空的情况下，读和写操作最后尝试唤醒时获取第二把锁，其余情况都不需要争取第二把锁。
        // 大大减少了锁竞争，把读写并发拆开来
        if (c == 0) {
            synchronized (takeLock) {
                takeLock.notify();
            }
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
            // 此处需要唤醒其他被阻塞的takeLock线程
            if (c - 1 > 0) {// 减去本次后还大于0，需要唤醒
                takeLock.notify();
            }
        }
        if (c == elements.length) {
            synchronized (putLock) {
                putLock.notify();
            }
        }
        return (T) e;
    }

    public int getCount() {
        return count.get();
    }
}
