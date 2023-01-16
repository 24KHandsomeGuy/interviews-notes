package com.bibabo.collections.queue;

import java.util.concurrent.ConcurrentLinkedQueue;

/**
 * @author fukuixiang
 * @date 2020/9/23
 * @time 14:06
 * @description 并发单向链表队列
 */
public class ConcurrentLinkedQueueTest {

    public static void main(String[] args) {

        ConcurrentLinkedQueue<Integer> concurrentLinkedQueue = new ConcurrentLinkedQueue<>();
        concurrentLinkedQueue.add(10);
        concurrentLinkedQueue.offer(11);
        //concurrentLinkedQueue.offer(null);

        System.out.println(concurrentLinkedQueue.peek());
        System.out.println(concurrentLinkedQueue.poll());
        System.out.println(concurrentLinkedQueue.poll());
        System.out.println(concurrentLinkedQueue.poll());
    }

}
