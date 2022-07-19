package com.bibabo.algorithm.leetcode.No350IntersectionOfTwoArrays;

import java.util.Arrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/13 20:18
 * @Description:
 */
public class InsersectionOfTwoArrays02 {

    public int[] intersect(int[] nums1, int[] nums2) {
        // 对两个数组排序
        Arrays.sort(nums1);
        Arrays.sort(nums2);
        int[] intersectionArr = new int[Math.min(nums1.length, nums2.length)];
        int index1 = 0, index2 = 0, index = 0;
        while (index1 < nums1.length && index2 < nums2.length) {
            if (nums1[index1] == nums2[index2]) {
                intersectionArr[index] = nums1[index1];
                index++;
                index1++;
                index2++;
            } else if (nums1[index1] > nums2[index2]) {
                index2++;
            } else {
                index1++;
            }
        }

        return Arrays.copyOfRange(intersectionArr, 0, index);
    }
}
