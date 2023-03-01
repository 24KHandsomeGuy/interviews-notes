package com.bibabo.algorithm.leetcode.L01TwoSum;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/1 10:42
 * @Description:
 */
public class Solution {
    public int[] twoSum(int[] nums, int target) {
        if (nums == null || nums.length == 1) return null;
        int[] indexs = new int[2];
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0;i < nums.length; i++) {
            if (map.get(target - nums[i]) != null) {
                indexs[0] = map.get(target - nums[i]);
                indexs[1] = i;
                return indexs;
            }
            map.put(nums[i], i);
        }
        return null;
    }
}
