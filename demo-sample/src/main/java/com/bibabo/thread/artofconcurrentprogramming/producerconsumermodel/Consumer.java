package com.bibabo.thread.artofconcurrentprogramming.producerconsumermodel;

import lombok.SneakyThrows;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/22 17:09
 * @Description:
 */
public class Consumer implements Runnable {

    private CustomerBlockingQueue<Integer> customerBlockingQueue;

    public Consumer(CustomerBlockingQueue<Integer> customerBlockingQueue) {
        this.customerBlockingQueue = customerBlockingQueue;
    }

    @SneakyThrows
    @Override
    public void run() {
        Integer element;
        while ((element = customerBlockingQueue.take()) != null) {
            System.out.println("Thread:" + Thread.currentThread().getName() + "消费者消费这个element：" + element);
        }
    }
}
