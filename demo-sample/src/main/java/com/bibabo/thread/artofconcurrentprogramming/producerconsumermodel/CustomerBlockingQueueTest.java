package com.bibabo.thread.artofconcurrentprogramming.producerconsumermodel;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/22 17:47
 * @Description:
 */
public class CustomerBlockingQueueTest {

    public static void main(String[] args) {
        CustomerBlockingQueue<Integer> customerBlockingQueue = new CustomerBlockingQueue<>();
        new Thread(new Producer(customerBlockingQueue), "producer-1").start();
        new Thread(new Producer(customerBlockingQueue), "producer-2").start();
        new Thread(new Consumer(customerBlockingQueue), "consumer-1").start();
        new Thread(new Consumer(customerBlockingQueue), "consumer-2").start();
        new Thread(new Consumer(customerBlockingQueue), "consumer-3").start();
        new Thread(new Consumer(customerBlockingQueue), "consumer-4").start();
    }
}
