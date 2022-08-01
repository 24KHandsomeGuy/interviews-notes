package com.bibabo.algorithm.leetcode.No4MedianOfTwoSortedArrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/28 15:11
 * @Description: O(log(min(m, n)))
 */
public class MedianOfTwoSortedArrays03 {

    public double findMedianSortedArrays(int[] nums1, int[] nums2) {

        if (nums1.length > nums2.length) {
            return findMedianSortedArrays(nums2, nums1);
        }
        // median1：前一部分的最大值
        // median2：后一部分的最小值
        int median1 = 0, median2 = 0;

        int m = nums1.length;
        int n = nums2.length;

        // 在nums1的区间[0, m]里查找恰当的分割线，
        // 使得nums1[i - 1] <= nums2[j]，nums2[j - 1] <= nums1[i]
        int left = 0;
        int right = m;

        while (left <= right) {
            int i = (left + right) / 2;
            // 分割线左边的所有元素个数满足(m + n + 1) / 2，其中奇数个数需要+1，左边多出一个
            int j = (m + n + 1) / 2 - i;

            // nums_im1, nums_i, nums_jm1, nums_j 分别表示 nums1[i-1], nums1[i], nums2[j-1], nums2[j]
            int nums_im1 = (i == 0 ? Integer.MIN_VALUE : nums1[i - 1]);
            int nums_i = (i == m ? Integer.MAX_VALUE : nums1[i]);
            int nums_jm1 = (j == 0 ? Integer.MIN_VALUE : nums2[j - 1]);
            int nums_j = (j == n ? Integer.MAX_VALUE : nums2[j]);

            if (nums_im1 <= nums_j) {
                median1 = Math.max(nums_im1, nums_jm1);
                median2 = Math.min(nums_i, nums_j);
                // [i + 1, right]
                left = i + 1;
            } else {
                // [left, i - 1]
                right = i - 1;
            }
        }

        return (m + n) % 2 == 0 ? (median1 + median2) / 2.0 : median1;
    }
}
