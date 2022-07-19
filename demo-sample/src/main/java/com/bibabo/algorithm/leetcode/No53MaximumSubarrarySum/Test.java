package com.bibabo.algorithm.leetcode.No53MaximumSubarrarySum;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/7 16:36
 * @Description:
 */
public class Test {

    public static void main(String[] args) {
        int[] nums = {-2, 1, -3, 4, -1, 2, 1, -5, 4};

        MaximumSubarraySum01 subarraySum01 = new MaximumSubarraySum01();
        int result01 = subarraySum01.maxSubArray(nums);
        System.out.println("result01:" + result01);

        MaximumSubarraySum02 subarraySum02 = new MaximumSubarraySum02();
        int result02 = subarraySum02.maxSubArray(nums);
        System.out.println("result02:" + result02);
    }
}
