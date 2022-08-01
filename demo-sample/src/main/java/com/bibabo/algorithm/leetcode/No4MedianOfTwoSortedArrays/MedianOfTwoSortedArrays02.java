package com.bibabo.algorithm.leetcode.No4MedianOfTwoSortedArrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/28 15:11
 * @Description: 相比于方法1，只寻找了（m + n）/ 2
 */
public class MedianOfTwoSortedArrays02 {

    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        int m = nums1.length;
        int n = nums2.length;
        int p1 = 0;
        int p2 = 0;
        int cur;
        int mid = (m + n) / 2 + 1;
        int va11 = 0, val2 = 0;
        while (p1 + p2 < mid) {
            boolean isAddP1 = false;
            if (p1 == m) {
                cur = nums2[p2];
            } else if (p2 == n) {
                cur = nums1[p1];
                isAddP1 = true;
            } else if (nums1[p1] > nums2[p2]) {
                cur = nums2[p2];
            } else {
                cur = nums1[p1];
                isAddP1 = true;
            }
            if (p1 + p2 == mid - 2) {
                va11 = cur;
            } else if (p1 + p2 == mid - 1) {
                val2 = cur;
            }

            if (isAddP1) {
                p1++;
            } else {
                p2++;
            }
        }
        if ((m + n) % 2 == 0) {
            return ((double) va11 + (double) val2) / 2;
        } else {
            return val2;
        }
    }
}
