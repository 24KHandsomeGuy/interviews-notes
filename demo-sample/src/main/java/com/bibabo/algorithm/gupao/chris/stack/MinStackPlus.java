package com.bibabo.algorithm.gupao.chris.stack;

import java.util.Stack;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/1 17:13
 * @Description:
 */
public class MinStackPlus {

    public static void main(String[] args) {

        MinStackPlus minStackPlus = new MinStackPlus();
        minStackPlus.push(-2);
        minStackPlus.push(0);
        minStackPlus.push(-3);
        minStackPlus.push(-2);
        minStackPlus.push(-1);
        System.out.println(minStackPlus.getMin());
        System.out.println(minStackPlus.pop());
        System.out.println(minStackPlus.top());
        System.out.println(minStackPlus.getMin());
    }

    // 不借助辅助栈，使用O(1)空间复杂度实现
    // 该栈不直接存储元素，存储的是元素栈（想象一下）中的每一个元素与该元素自此向下的所有元素中的最小值的差值
    /**
     * |  8  |  |  7  |   出栈：7 + 1 = 8
     * |  1  |  | -1  |   出栈：1
     * |  7  |  |  5  |   出栈：5 + 2 = 7
     * |  2  |  | -1  |   出栈：2
     * |  3  |  | -2  |   出栈：3
     * |__5__|  |__0__|   出栈：5
     * 左边为想象出的元素栈，右边为差值栈
     */
    Stack<Long> stack;
    // 此处一定要用long长整型。假如用int类型，当前min为int最小值，push压栈的val为int最大值，val - min得出的结果会是一个超出int范围的值
    long min;

    public MinStackPlus() {
        stack = new Stack<>();
    }

    public void push(int val) {
        if (stack.isEmpty()) {
            min = (long) val;
            stack.push(0L);
            return;
        }
        // 将元素栈中的当前元素，自此向下的所有元素中的最小值的差值压栈
        stack.push(val - min);
        // 如果差值为负数，当前元素为整个元素栈的最小值，替换最小值
        min = Math.min(min, val);
    }

    public int pop() {
        long stackTop = stack.pop();
        if (stackTop < 0) {
            // 如果栈顶为负数，说明最小值min就是元素栈（虚拟出来的逻辑栈）的栈顶元素
            // 返回该元素之前，需要重新计算剩余元素栈中的最小值，替换为min
            // 入栈时：min - lastmin = stack.peek()stackTop; 这里求lastmin
            long rtnMin = min;
            min = min - stackTop;
            return (int) rtnMin;
        }
        // 如果栈顶为非负数，说明入栈时val（元素栈） - min = stack.peek()stackTop;
        // min不需要被替换
        return (int) (stackTop + min);
    }

    public int top() {
        // 如果栈顶为负数，说明最小值min就是元素栈（虚拟出来的逻辑栈）的栈顶元素
        if (stack.peek() < 0) {
            return (int) min;
        }
        // 如果栈顶为非负数，说明入栈时val（元素栈） - min = stack.peek();
        return (int) (stack.peek() + min);
    }

    public int getMin() {
        return (int) min;
    }
}
