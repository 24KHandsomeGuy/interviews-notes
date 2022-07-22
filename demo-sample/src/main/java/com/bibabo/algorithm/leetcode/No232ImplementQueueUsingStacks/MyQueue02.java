package com.bibabo.algorithm.leetcode.No232ImplementQueueUsingStacks;

import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/21 11:04
 * @Description: push时候倒两边，很蠢得办法
 */
public class MyQueue02 {

    Stack<Integer> stackFirst = new Stack();

    Stack<Integer> stackSecond = new Stack();

    // Lock lock = new ReentrantLock();

    public MyQueue02() {

    }

    public void push(int x) {
        while (!stackFirst.isEmpty()) {
            // drop to second
            stackSecond.push(stackFirst.pop());
        }
        // push new value to bottom
        stackFirst.push(x);
        while (!stackSecond.isEmpty()) {
            stackFirst.push(stackSecond.pop());
        }
    }

    public int pop() {
        return stackFirst.pop();
    }

    public int peek() {
        return stackFirst.peek();
    }

    public boolean empty() {
        return stackFirst.isEmpty();
    }
}
