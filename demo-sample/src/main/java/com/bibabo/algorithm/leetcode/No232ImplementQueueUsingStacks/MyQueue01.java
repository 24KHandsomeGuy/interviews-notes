package com.bibabo.algorithm.leetcode.No232ImplementQueueUsingStacks;

import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/21 11:04
 * @Description: 用两个栈实现队列，首先想到，如何让先进入得元素放到其中一个栈得栈顶
 * 这种方法是有需要再倒
 */
public class MyQueue01 {

    Stack<Integer> stackFirst = new Stack();

    Stack<Integer> stackSecond = new Stack();

    // Lock lock = new ReentrantLock();

    public MyQueue01() {

    }

    public void push(int x) {
        stackFirst.push(x);
    }

    public int pop() {

        if (!stackSecond.isEmpty()) {
            return stackSecond.pop();
        }
        if (stackFirst.isEmpty()) {
            throw new NullPointerException("MyQueue01 has no elements");
        }
        // drop first stack to second stack
        while (!stackFirst.isEmpty()) {
            stackSecond.push(stackFirst.pop());
        }
        return stackSecond.pop();
    }

    public int peek() {
        if (!stackSecond.isEmpty()) {
            return stackSecond.peek();
        }
        if (stackFirst.isEmpty()) {
            throw new NullPointerException("MyQueue01 has no elements");
        }
        // drop first stack to second stack
        while (!stackFirst.isEmpty()) {
            stackSecond.push(stackFirst.pop());
        }
        return stackSecond.peek();
    }

    public boolean empty() {
        return stackFirst.isEmpty() && stackSecond.isEmpty();
    }
}
