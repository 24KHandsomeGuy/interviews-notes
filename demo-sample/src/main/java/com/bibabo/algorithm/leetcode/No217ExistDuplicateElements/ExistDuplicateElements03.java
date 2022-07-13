package com.bibabo.algorithm.leetcode.No217ExistDuplicateElements;

import java.util.Arrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/7 11:01
 * @Description:
 */
public class ExistDuplicateElements03 {

    public boolean containsDuplicate(int[] nums) {
        return Arrays.stream(nums).distinct().count() < nums.length;
    }

}
