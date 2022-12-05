package com.bibabo.algorithm.gupao.chris.stack;

import java.util.Stack;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/1 17:13
 * @Description:
 */
public class MinStack {

    // 我们可以使用一个辅助栈，与元素栈同步插入与删除，用于存储当前元素栈中的最小值
    /**
     * 1.当一个元素要入栈时，我们取当前辅助栈的栈顶存储的最小值，与当前元素比较得出最小值，将这个最小值插入辅助栈中；
     * 2.当一个元素要出栈时，我们把辅助栈的栈顶元素也一并弹出；
     * 3.在任意一个时刻，栈内元素的最小值就存储在辅助栈的栈顶元素中。
     */

    Stack<Integer> stack;
    Stack<Integer> minStack;

    public MinStack() {
        stack = new Stack<>();
        minStack = new Stack<>();
    }

    public void push(int val) {
        int minVal = minStack.isEmpty() ? val : (minStack.peek() < val ? minStack.peek() : val);
        minStack.push(minVal);
        stack.push(val);
    }

    public int pop() {
        minStack.pop();
        return stack.pop();
    }

    public int top() {
        return stack.peek();
    }

    public int getMin() {
        return minStack.peek();
    }
}
