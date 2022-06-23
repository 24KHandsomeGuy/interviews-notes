package com.bibabo.thread.artofconcurrentprogramming.producerconsumermodel;

import lombok.SneakyThrows;

import java.util.LinkedList;
import java.util.Queue;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/22 17:24
 * @Description:
 */
public class CustomerBlockingQueue<T> {

    private Queue<T> queue = new LinkedList<>();

    private Object lock = new Object();

    public boolean add(T t) {
        synchronized (lock) {
            boolean rst = queue.add(t);
            lock.notify();
            return rst;
        }
    }


    public T take() throws InterruptedException {
        synchronized (lock) {
            T t;
            while ((t = queue.poll()) == null) {
                lock.wait();
            }
            return t;
        }
    }
}
