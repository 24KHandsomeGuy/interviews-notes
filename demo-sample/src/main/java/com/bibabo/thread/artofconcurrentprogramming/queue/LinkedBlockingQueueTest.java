package com.bibabo.thread.artofconcurrentprogramming.queue;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2020/9/23
 * @time 14:06
 * @description 并发单向链表队列
 */
public class LinkedBlockingQueueTest {

    public static void main(String[] args) throws InterruptedException {
        // throw exception process
        LinkedBlockingQueue<Integer> queueException = new LinkedBlockingQueue<>(2);
        queueException.add(1);
        queueException.add(2);
        try {
            queueException.add(3);
        } catch (RuntimeException e) {
            e.printStackTrace();
        }
        System.out.println("-------------------");
        System.out.println(queueException.remove());
        System.out.println(queueException.remove());
        try {

            System.out.println(queueException.element());
        } catch (RuntimeException e) {
            e.printStackTrace();
        }
        try {
            System.out.println(queueException.remove());
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        System.out.println();
        System.out.println();

        // return result if illegal
        LinkedBlockingQueue<Integer> queueResult = new LinkedBlockingQueue<>(2);
        System.out.println(queueResult.offer(4));
        System.out.println(queueResult.offer(5));
        System.out.println(queueResult.offer(6));
        new Thread(() -> {
            try {
                System.out.println("Thread-7" + queueResult.offer(7, 5, TimeUnit.SECONDS));
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();
        System.out.println("-------------------");
        System.out.println(queueResult.poll());
        System.out.println(queueResult.poll());
        System.out.println(queueResult.poll());
        try {
            System.out.println(queueResult.poll(5, TimeUnit.SECONDS));
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(queueResult.peek());

        System.out.println();
        System.out.println();

        TimeUnit.SECONDS.sleep(10);

        // always block if illegal
        LinkedBlockingQueue<Integer> queueBlock = new LinkedBlockingQueue<>(2);
        queueBlock.put(8);
        queueBlock.put(9);
        new Thread(() -> {
            try {
                TimeUnit.SECONDS.sleep(5);
                System.out.println("Thread-8：" + queueBlock.take());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();
        queueBlock.put(10);


    }

}
