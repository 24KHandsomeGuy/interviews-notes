package com.bibabo.algorithm.leetcode.No1TwoNumSum;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/8 15:15
 * @Description:
 */
public class TwoNumSum01 {

    public int[] twoSum(int[] nums, int target) {
        int[] indexs = new int[2];
        for (int i = 0; i < nums.length; i++) {
            for (int j = i + 1; j < nums.length; j++) {
                if (nums[i] + nums[j] == target) {
                    indexs[0] = i;
                    indexs[1] = j;
                    return indexs;
                }
            }
        }
        return null;
    }

}
