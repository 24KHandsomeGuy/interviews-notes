package com.bibabo.algorithm.leetcode.No4MedianOfTwoSortedArrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/28 15:11
 * @Description: 先合并数组，再根据数组长度的奇偶判断出中位数
 */
public class MedianOfTwoSortedArrays01 {

    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        // 合并数组
        int m = nums1.length;
        int n = nums2.length;
        int p1 = 0;
        int p2 = 0;
        int cur;
        int[] newNums = new int[m + n];
        while (p1 < m || p2 < n) {
            if (p1 == m) {
                cur = nums2[p2++];
            } else if (p2 == n) {
                cur = nums1[p1++];
            } else if (nums1[p1] > nums2[p2]) {
                cur = nums2[p2++];
            } else {
                cur = nums1[p1++];
            }
            newNums[p1 + p2 - 1] = cur;
        }
        double ans;
        if ((m + n) % 2 == 0) {
            ans = (newNums[(m + n) / 2] + newNums[(m + n) / 2 - 1]) / 2.0;
        } else {
            ans = newNums[(m + n) / 2];
        }
        return ans;
    }
}
