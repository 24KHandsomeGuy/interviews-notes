package com.bibabo.algorithm.leetcode.No217ExistDuplicateElements;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/7 11:00
 * @Description:
 */
public class Test {

    public static void main(String[] args) {
        // int[] nums = {1,2,3,4,5};
        int[] nums = {1,2,3,4,1};
        ExistDuplicateElements01 duplicateElements01 = new ExistDuplicateElements01();
        boolean isExist1 = duplicateElements01.containsDuplicate(nums);
        System.out.println("01 is exist:" + isExist1);

        ExistDuplicateElements02 duplicateElements02 = new ExistDuplicateElements02();
        boolean isExist2 = duplicateElements02.containsDuplicate(nums);
        System.out.println("02 is exist:" + isExist2);

        ExistDuplicateElements03 duplicateElements03 = new ExistDuplicateElements03();
        boolean isExist3 = duplicateElements03.containsDuplicate(nums);
        System.out.println("03 is exist:" + isExist3);
    }

}
