package com.bibabo.algorithm.datastructure.stack.minstack;

import java.util.Stack;

/**
 * @author fukuixiang
 * @date 2020/9/16
 * @time 10:46
 * @description use O(1) time complexity get the stack the least element
 */
public class MinStack {

    public static void main(String[] args) {

        int[] numbers = {5,3,9,2,7,9,1};

        int minVal = getStackMinValue(numbers);
        System.out.println(minVal);
    }

    /**
     * time complexity O(1)
     * space complexity O(n)
     * @param nums
     * @return
     */
    private static int getStackMinValue(int[] nums) {

        Stack<Integer> stack = new Stack<Integer>();
        Stack<Integer> minStack = new Stack<Integer>();

        for (int i = 0;i < nums.length;i ++) {
            stack.push(nums[i]);

            if (!minStack.isEmpty() && minStack.peek() < nums[i]) {
                minStack.push(minStack.peek());
            } else {
                minStack.push(nums[i]);
            }
        }

        return minStack.peek();
    }


}
