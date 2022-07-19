package com.bibabo.algorithm.leetcode.No88MergeTwoArrays;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/13 15:20
 * @Description:
 */
public class Test {

    public static void main(String[] args) {
        int[] nums1 = {4, 5, 6, 0, 0, 0};
        int[] nums2 = {1, 3, 5};

        /*MergeTwoArrays01 mergeTwoArrays01 = new MergeTwoArrays01();
        mergeTwoArrays01.merge(nums1, 3, nums2, nums2.length);

        Arrays.stream(nums1).forEach(System.out::println);*/

        /*System.out.println("---------------------");
        MergeTwoArrays02 mergeTwoArrays02 = new MergeTwoArrays02();
        mergeTwoArrays02.merge(nums1, 3, nums2, nums2.length);

        Arrays.stream(nums1).forEach(System.out::println);*/

        System.out.println("---------------------");
        MergeTwoArrays03 mergeTwoArrays03 = new MergeTwoArrays03();
        mergeTwoArrays03.merge(nums1, 3, nums2, nums2.length);

        Arrays.stream(nums1).forEach(System.out::println);
    }
}
