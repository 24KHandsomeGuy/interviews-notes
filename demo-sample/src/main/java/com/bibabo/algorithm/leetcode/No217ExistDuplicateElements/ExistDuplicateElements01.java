package com.bibabo.algorithm.leetcode.No217ExistDuplicateElements;

import java.util.HashSet;
import java.util.Set;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/7 11:01
 * @Description:
 */
public class ExistDuplicateElements01 {

    public boolean containsDuplicate(int[] nums) {
        Set<Integer> set = new HashSet<>();
        for (int num : nums) {
            if (set.contains(num)) {
                return true;
            }
            set.add(num);
        }
        return false;
    }

}
