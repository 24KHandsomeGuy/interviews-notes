package com.bibabo.algorithm.gupao.chris.queue;

import java.util.Stack;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/2 14:11
 * @Description: implement queue using stacks
 * 聪明做法，只有out stack为空时，才将另一stack倒进来，只倒一遍
 */
public class MyQueuePlus {

    private Stack<Integer> inStack = new Stack<>();

    private Stack<Integer> outStack = new Stack<>();

    public MyQueuePlus() {

    }

    public void push(int x) {
        inStack.push(x);
    }

    public int pop() {
        if (outStack.isEmpty()) {
            // 将inStack倒进来
            in2out();
        }
        return outStack.pop();
    }

    private void in2out() {
        while (!inStack.isEmpty())
            outStack.push(inStack.pop());
    }

    public int peek() {
        if (outStack.isEmpty()) {
            // 将inStack倒进来
            in2out();
        }
        return outStack.peek();
    }

    public boolean empty() {
        return inStack.isEmpty() && outStack.isEmpty();
    }
}
