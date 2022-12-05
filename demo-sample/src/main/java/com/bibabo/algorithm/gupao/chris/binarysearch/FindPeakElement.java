package com.bibabo.algorithm.gupao.chris.binarysearch;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/4 16:59
 * @Description: 寻找峰值元素
 *  1 2 1 3 5 6 4
 *  峰值元素peak element要比周围两个数字都大2和6都满足
 */
public class FindPeakElement {

    public int findPeakElement(int[] nums) {
        if (nums == null || nums.length == 0) {
            return -1;
        }
        int startIndex = 0;
        int endIndex = nums.length - 1;
        while (startIndex < endIndex) {
            int middleIndex = (startIndex + endIndex) >> 1;
            if (nums[middleIndex] < nums[middleIndex - 1]) {
                endIndex = middleIndex - 1;
            } else if (nums[middleIndex] < nums[middleIndex + 1]) {
                startIndex = middleIndex + 1;
            } else {
                return middleIndex;
            }
        }
        return -1;
    }
}
