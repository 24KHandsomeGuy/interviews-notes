package com.bibabo.collections.queue;

import java.util.Deque;
import java.util.concurrent.ConcurrentLinkedDeque;

/**
 * @author fukuixiang
 * @date 2020/9/23
 * @time 14:06
 * @description 并发双端链表队列
 */
public class ConcurrentLinkedDequeTest {

    public static void main(String[] args) {

        /*//queue
        //last in first out
        Deque<Integer> deque = new ConcurrentLinkedDeque<>();
        deque.add(10);
        deque.addLast(11);
        deque.addLast(12);
        System.out.println(deque.pop());
        System.out.println(deque.poll());
        System.out.println(deque.pollFirst());
        System.out.println(deque.pollFirst());*/

        //stack
        //first in first out
        Deque<Integer> deque = new ConcurrentLinkedDeque<>();
        deque.addFirst(10);
        deque.addFirst(11);
        deque.addFirst(12);
        System.out.println(deque.poll());
        System.out.println(deque.pollFirst());
        System.out.println(deque.pollFirst());
        System.out.println(deque.pollFirst());

    }

}
