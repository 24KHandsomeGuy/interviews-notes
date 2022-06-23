package com.bibabo.thread.artofconcurrentprogramming.producerconsumermodel;

import java.util.ArrayList;
import java.util.Optional;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/23 10:53
 * @Description:
 */
public class MyThreadPool<T extends Runnable> {

    private ArrayList<Thread> workerList = new ArrayList();

    private CustomerBlockingQueue<T> queue = new CustomerBlockingQueue<>();

    private int threadNums;

    public MyThreadPool(int threadNums) {
        this.threadNums = threadNums;
        for (int i = 0; i < this.threadNums; i++) {
            Worker<T> worker = new Worker<>(queue);
            Thread t = new Thread(worker, "worker-" + i);
            t.start();
            workerList.add(t);
        }
    }

    public MyThreadPool() {
        this(Runtime.getRuntime().availableProcessors());
    }

    public void execute(T t) {
        queue.add(t);
    }

    public void shutdown() {
        workerList.forEach(w -> {
            w.interrupt();
        });
    }

    private static class Worker<T extends Runnable> implements Runnable {

        CustomerBlockingQueue<T> queue;

        volatile boolean runFlag = true;

        public Worker(CustomerBlockingQueue<T> queue) {
            this.queue = queue;
        }

        @Override
        public void run() {
            T t = null;
            while (!Thread.currentThread().isInterrupted()) {
                try {
                    t = queue.take();
                } catch (InterruptedException e) {
                    System.out.println("worker" + Thread.currentThread().getName() + "阻塞时被中断，标识被复位：" + Thread.currentThread().isInterrupted());
                    Thread.currentThread().interrupt();
                }
                Optional.ofNullable(t).ifPresent(t1 -> t1.run());
                t = null;
            }
            System.out.println("worker" + Thread.currentThread().getName() + "销毁");
        }
    }
}
