package com.bibabo.algorithm.leetcode.No88MergeTwoArrays;

import java.util.Arrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/13 15:18
 * @Description:
 */
public class MergeTwoArrays01 {

    public void merge(int[] nums1, int m, int[] nums2, int n) {
        for (int i = 0; i < n; i++) {
            nums1[m + i] = nums2[i];
        }
        Arrays.sort(nums1);
    }
}
