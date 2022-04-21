package com.bibabo.collections.list;

import java.util.Stack;

/**
 * @author fukuixiang
 * @date 2020/9/22
 * @time 14:24
 * @description
 */
public class StactTest {

    public static void main(String[] args) {

        Stack<Integer> stack = new Stack<>();

        /*stack.add(10);
        stack.add(20);
        System.out.println(stack.get(1));*/
        stack.push(10);
        stack.push(11);
        stack.push(12);

        System.out.println(stack.pop());

    }

}
