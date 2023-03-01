package com.bibabo.algorithm.leetcode.L01TwoSum;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/1 10:49
 * @Description:
 */
public class Solution2 {
    public int[] twoSum(int[] nums, int target) {
        if (nums == null || nums.length == 1) return null;
        int[] resultIndexs = new int[2];
        for (int i = 0; i < nums.length; i++) {
            for (int j = i + 1; j < nums.length; j++) {
                if (nums[i] + nums[j] == target) {
                    resultIndexs[0] = i;
                    resultIndexs[1] = j;
                    return resultIndexs;
                }
            }
        }
        return null;
    }

}
