package com.bibabo.algorithm.leetcode.No88MergeTwoArrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/13 15:18
 * @Description:
 */
public class MergeTwoArrays02 {

    public void merge(int[] nums1, int m, int[] nums2, int n) {
        // p1是nums1的游标 p2是nums2的游标
        int p1 = 0, p2 = 0;
        int[] sorted = new int[m + n];
        int curr = 0;
        for (; p1 < m || p2 < n; ) {
            if (p1 == m) {
                curr = nums2[p2++];
            } else if (p2 == n) {
                curr = nums1[p1++];
            } else if (nums1[p1] > nums2[p2]) {
                curr = nums2[p2++];
            } else {
                curr = nums1[p1++];
            }
            sorted[p1 + p2 - 1] = curr;
        }
        for (int i = 0; i < sorted.length; i++) {
            nums1[i] = sorted[i];
        }
    }
}
