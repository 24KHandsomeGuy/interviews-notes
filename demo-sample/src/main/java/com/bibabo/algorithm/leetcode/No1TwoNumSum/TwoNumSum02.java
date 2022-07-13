package com.bibabo.algorithm.leetcode.No1TwoNumSum;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/8 15:15
 * @Description:
 */
public class TwoNumSum02 {

    public int[] twoSum(int[] nums, int target) {
        int[] indexs = new int[2];
        // key:target-值  value:下标
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
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
