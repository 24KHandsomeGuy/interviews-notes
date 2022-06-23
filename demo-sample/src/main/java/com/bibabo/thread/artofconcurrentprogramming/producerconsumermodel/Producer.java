package com.bibabo.thread.artofconcurrentprogramming.producerconsumermodel;

import lombok.SneakyThrows;

import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/22 17:09
 * @Description:
 */
public class Producer implements Runnable {

    private CustomerBlockingQueue<Integer> customerBlockingQueue;

    public Producer(CustomerBlockingQueue<Integer> customerBlockingQueue) {
        this.customerBlockingQueue = customerBlockingQueue;
    }

    @SneakyThrows
    @Override
    public void run() {
        while (!Thread.currentThread().isInterrupted()) {
            int random = new Random().nextInt(10);
            TimeUnit.SECONDS.sleep(random);
            customerBlockingQueue.add(random);
            System.out.println("Thread:" + Thread.currentThread().getName() + "生成者生产这个element：" + random);
        }
    }
}
