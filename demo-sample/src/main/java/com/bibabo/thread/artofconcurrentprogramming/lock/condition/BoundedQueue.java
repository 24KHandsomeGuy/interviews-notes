package com.bibabo.thread.artofconcurrentprogramming.lock.condition;

import com.bibabo.thread.artofconcurrentprogramming.producerconsumermodel.CustomerLimitedBlockingQueue;
import com.bibabo.thread.artofconcurrentprogramming.producerconsumermodel.CustomerLimitedBlockingQueue2;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/1/11 16:06
 * @Description:
 */
public class BoundedQueue<T> {

    private Object[] elements;

    private int addIndex, removeIndex, count;

    private Lock lock = new ReentrantLock();

    private Condition notEmpty = lock.newCondition();

    private Condition notFull = lock.newCondition();

    public BoundedQueue(int count) {
        this.elements = new Object[count];
    }

    public void put(T e) throws InterruptedException {
        // 如果满了需要阻塞，等待有元素被删除后唤醒
        lock.lock();
        try {
            while (count == elements.length) {
                notFull.await();
            }
            elements[addIndex] = e;
            if (++addIndex == elements.length) {
                addIndex = 0;
            }
            ++count;
            notEmpty.signal();
        } finally {
            lock.unlock();
        }
    }

    @SuppressWarnings("unchecked")
    public T take() throws InterruptedException {
        // 如果空了需要阻塞，等待有元素被添加后唤醒
        lock.lock();
        try {
            while (count == 0) {
                notEmpty.await();
            }
            // FIFO
            Object e = elements[removeIndex];
            elements[removeIndex] = null;
            if (++removeIndex == elements.length) {
                removeIndex = 0;
            }
            --count;
            notFull.signal();
            return (T) e;
        } finally {
            lock.unlock();
        }
    }


    public static void main(String[] args) throws InterruptedException {

        // BoundedQueue<Integer> queue = new BoundedQueue<>(3);
        CustomerLimitedBlockingQueue2<Integer> queue = new CustomerLimitedBlockingQueue2<>(3);

        for (int i = 0; i < 10; i++) {
            final int e = i;
            new Thread(() -> {
                try {
                    queue.put(e);
                } catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
                System.out.println(Thread.currentThread().getName() + " [add] element:" + e);
            }, "thread-" + i).start();
        }

        TimeUnit.SECONDS.sleep(5);
        System.out.println("--------------------" + queue.getCount());

        for (int i = 10; i < 20; i++) {
            new Thread(() -> {
                int e = 0;
                try {
                    e = queue.take();
                } catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
                System.out.println(Thread.currentThread().getName() + " [take] element:" + e);
            }, "thread-" + i).start();
        }

        TimeUnit.SECONDS.sleep(5);
        System.out.println("--------------------" + queue.getCount());

        for (int i = 20; i < 30; i++) {
            new Thread(() -> {
                int e = 0;
                try {
                    e = queue.take();
                } catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
                System.out.println(Thread.currentThread().getName() + " [take] element:" + e);
            }, "thread-" + i).start();
        }

        TimeUnit.SECONDS.sleep(5);
        System.out.println("--------------------" + queue.getCount());

        for (int i = 30; i < 40; i++) {
            final int e = i;
            new Thread(() -> {
                try {
                    queue.put(e);
                } catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
                System.out.println(Thread.currentThread().getName() + " [add] element:" + e);
            }, "thread-" + i).start();
        }

        TimeUnit.SECONDS.sleep(5);
        System.out.println("--------------------" + queue.getCount());

    }
}
