package com.bibabo.algorithm.leetcode.No53MaximumSubarrarySum;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/7 16:24
 * @Description:
 */
public class MaximumSubarraySum01 {

    public int maxSubArray(int[] nums) {
        int max = nums[0], previousIntervalSum = nums[0];
        for (int i = 1; i < nums.length; i ++) {
            // 如果上一段区间是负数则以当前数值开启一个新区间，否则则加入这个区间
            previousIntervalSum = Math.max(previousIntervalSum + nums[i], nums[i]);
            max = Math.max(max, previousIntervalSum);
        }
        return max;
    }
}
