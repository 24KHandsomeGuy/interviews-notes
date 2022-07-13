package com.bibabo.algorithm.leetcode.No217ExistDuplicateElements;

import java.util.Arrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/7 11:01
 * @Description:
 */
public class ExistDuplicateElements02 {

    public boolean containsDuplicate(int[] nums) {
        Arrays.sort(nums);
        // 需要少检索一个，否则会下标越界nums.length - 1
        for (int i = 0; i < nums.length - 1; i++) {
            if (nums[i] == nums[i + 1]) {
                return true;
            }

        }
        return false;
    }

}
