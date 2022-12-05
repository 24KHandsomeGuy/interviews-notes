package com.bibabo.algorithm.gupao.chris.queue;

import java.util.LinkedList;
import java.util.Queue;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/2 14:11
 * @Description: implement stack using queues
 * 聪明做法，每次push只倒一遍queue
 */
public class MyStackPlus {

    private Queue<Integer> emptyQueue = new LinkedList<>();

    private Queue<Integer> valQueue = new LinkedList<>();

    public MyStackPlus() {

    }

    public void push(int x) {
        emptyQueue.offer(x);
        while (!valQueue.isEmpty())
            emptyQueue.offer(valQueue.poll());
        Queue<Integer> tmp = valQueue;
        valQueue = emptyQueue;
        emptyQueue = tmp;
    }

    public int pop() {
        return valQueue.remove();
    }

    public int top() {
        return valQueue.element();
    }

    public boolean empty() {
        return valQueue.isEmpty();
    }
}
