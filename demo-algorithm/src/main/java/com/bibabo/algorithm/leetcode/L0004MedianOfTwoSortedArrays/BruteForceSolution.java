package com.bibabo.algorithm.leetcode.L0004MedianOfTwoSortedArrays;

import java.util.Arrays;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/2 10:03
 * @Description: 暴力解法
 * O(log m+n) 的解法看不懂，等最后再攻克
 */
public class BruteForceSolution {

    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        
        // brute force
        if (nums1 == null && nums2 == null) return 0;
        double[] numsMerge = new double[nums1.length + nums2.length];
        int idx = 0;
        for (int i = 0; i < nums1.length; i++) {
            numsMerge[idx++] = nums1[i];
        }
        for (int i = 0; i < nums2.length; i++) {
            numsMerge[idx++] = nums2[i];
        }
        Arrays.sort(numsMerge);
        boolean lengthIsOdd = numsMerge.length % 2 == 1;
        if (lengthIsOdd) {
            return numsMerge[numsMerge.length / 2];
        } else {
            return (numsMerge[numsMerge.length / 2 - 1] + numsMerge[numsMerge.length / 2]) / 2;
        }
    }
}
