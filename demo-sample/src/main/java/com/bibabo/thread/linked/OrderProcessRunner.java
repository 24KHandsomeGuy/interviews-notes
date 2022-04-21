package com.bibabo.thread.linked;

import java.util.concurrent.BlockingQueue;

/**
 * @author fukuixiang
 * @date 2021/3/2
 * @time 16:10
 * @description
 */
public class OrderProcessRunner extends Thread {

    BlockingQueue<Order> queue;

    BaseProcessor processor;

    public OrderProcessRunner(BlockingQueue<Order> queue, BaseProcessor processor) {
        this.queue = queue;
        this.processor = processor;
    }

    @Override
    public void run() {
        try {
            while (!Thread.currentThread().isInterrupted()) {
                Order order = queue.take();
                processor.process(order);
            }
        } catch (InterruptedException e) {
            System.err.println("线程：" + Thread.currentThread().getName() + "被中断");
        }
    }
}
