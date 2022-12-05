package com.bibabo.algorithm.gupao.chris.queue;

import java.util.Stack;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/2 14:11
 * @Description: implement queue using stacks
 * 傻瓜做法，每次push都倒两遍stack
 */
public class MyQueue {

    private Stack<Integer> leftStack = new Stack<>();

    private Stack<Integer> rightStack = new Stack<>();

    public MyQueue() {

    }

    public void push(int x) {
        if (rightStack.isEmpty()) {
            rightStack.push(x);
            return;
        }
        while (!rightStack.isEmpty()) {
            leftStack.push(rightStack.pop());
        }
        rightStack.push(x);
        while (!leftStack.isEmpty()) {
            rightStack.push(leftStack.pop());
        }
    }

    public int pop() {
        return rightStack.pop();
    }

    public int peek() {
        return rightStack.peek();
    }

    public boolean empty() {
        return rightStack.isEmpty();
    }
}
