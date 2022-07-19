package com.bibabo.algorithm.leetcode.No88MergeTwoArrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/13 15:18
 * @Description:
 */
public class MergeTwoArrays03 {

    public void merge(int[] nums1, int m, int[] nums2, int n) {
        // p1是nums1的游标 p2是nums2的游标
        int p1 = m - 1, p2 = n - 1;
        int tail = m + n - 1;
        int curr;
        for (; p1 >= 0 || p2 >= 0; ) {
            if (p1 == -1) {
                curr = nums2[p2--];
            } else if (p2 == -1) {
                curr = nums1[p1--];
            } else if (nums1[p1] > nums2[p2]) {
                curr = nums1[p1--];
            } else {
                curr = nums2[p2--];
            }
            nums1[tail--] = curr;
        }
    }
}
