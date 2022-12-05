package com.bibabo.algorithm.gupao.chris.binarysearch;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/2 17:58
 * @Description:
 */
public class SortedArrayBinarySearch {

    public static void main(String[] args) {
        int[] arr = new int[]{-1, 0, 3, 5, 9, 12};
        System.out.println(search(arr, 0));
    }

    public static int search(int[] nums, int target) {
        if (nums == null || nums.length == 0) {
            return -1;
        }
        int startIndex = 0;
        int endIndex = nums.length - 1;
        int middleIndex;
        while (startIndex <= endIndex) {
            middleIndex = (startIndex + endIndex) / 2;
            if (nums[middleIndex] == target) {
                return middleIndex;
            } else if (target < nums[middleIndex]) {
                endIndex = middleIndex - 1;
            } else {
                startIndex = middleIndex + 1;
            }
        }
        return -1;
    }
}
