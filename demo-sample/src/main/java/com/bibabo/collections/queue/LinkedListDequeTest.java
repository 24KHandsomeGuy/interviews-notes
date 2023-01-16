package com.bibabo.collections.queue;

import java.util.Deque;
import java.util.LinkedList;
import java.util.Queue;

/**
 * @author fukuixiang
 * @date 2020/9/23
 * @time 15:37
 * @description
 */
public class LinkedListDequeTest {

    public static void main(String[] args) {

        /*//queue
        //first in first out
        Queue<Integer> queue = new LinkedList<>();
        queue.add(10);
        queue.add(11);
        queue.offer(12);
        //System.out.println(queue.element());

        //System.out.println(queue.peek());
        System.out.println(queue.poll());
        System.out.println(queue.poll());
        System.out.println(queue.poll());
        System.out.println(queue.poll());
*/
        /*//deque double ended queue
        //queue first in first out
        Deque<Integer> deque = new LinkedList<>();
        deque.add(10);
        deque.addLast(11);
        deque.addLast(12);

        System.out.println(deque.poll());
        System.out.println(deque.pollFirst());
        System.out.println(deque.pollFirst());*/

        //deque double ended queue
        //stack last in first out
        Deque<Integer> deque = new LinkedList<>();
        deque.addFirst(10);
        deque.addFirst(11);
        deque.addFirst(12);

        System.out.println(deque.poll());
        System.out.println(deque.pollFirst());
        System.out.println(deque.pollFirst());

    }

}
