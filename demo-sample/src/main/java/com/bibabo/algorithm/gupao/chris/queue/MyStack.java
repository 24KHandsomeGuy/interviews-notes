package com.bibabo.algorithm.gupao.chris.queue;

import java.util.LinkedList;
import java.util.Queue;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/2 14:11
 * @Description: implement stack using queues
 * 傻瓜做法，每次push都倒两遍queue
 */
public class MyStack {

    private Queue<Integer> leftQueue = new LinkedList<>();

    private Queue<Integer> rightQueue = new LinkedList<>();

    public MyStack() {

    }

    public void push(int x) {
        if (rightQueue.isEmpty()) {
            rightQueue.offer(x);
            return;
        }
        while (!rightQueue.isEmpty()) {
            leftQueue.offer(rightQueue.poll());
        }
        rightQueue.offer(x);
        while (!leftQueue.isEmpty()) {
            rightQueue.offer(leftQueue.poll());
        }
    }

    public int pop() {
        return rightQueue.remove();
    }

    public int top() {
        return rightQueue.element();
    }

    public boolean empty() {
        return rightQueue.isEmpty();
    }
}
