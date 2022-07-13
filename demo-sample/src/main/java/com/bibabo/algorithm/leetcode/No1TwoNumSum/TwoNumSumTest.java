package com.bibabo.algorithm.leetcode.No1TwoNumSum;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/8 16:35
 * @Description:
 */
public class TwoNumSumTest {

    public static void main(String[] args) {
        int[] nums = {2, 7, 11, 15};
        int target = 18;

        TwoNumSum01 twoNumSum01 = new TwoNumSum01();
        int[] indexs01 = twoNumSum01.twoSum(nums, target);
        System.out.println("01:" + indexs01[0] + "---" + indexs01[1]);

        TwoNumSum02 twoNumSum02 = new TwoNumSum02();
        int[] indexs02 = twoNumSum01.twoSum(nums, target);
        System.out.println("02:" + indexs02[0] + "---" + indexs02[1]);

    }
}
