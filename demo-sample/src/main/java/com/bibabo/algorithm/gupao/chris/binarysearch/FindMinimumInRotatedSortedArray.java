package com.bibabo.algorithm.gupao.chris.binarysearch;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/4 16:06
 * @Description: 在旋转有序数组里寻找最小值
 * maybe: [4,5,6,7,0,1,2]
 * maybe: [0,1,2,4,5,6,7]
 * 将数组一分为2，有一边一定是有序的，而另一边可能是有序的也可能是无序的
 * 有序的一边，最左边的值是该边的最小值，取出最小值，并舍弃这一边。
 * 继续寻找另一边
 */
public class FindMinimumInRotatedSortedArray {


    public static int finMin(int[] nums) {
        if (nums == null || nums.length == 0) {
            return -1;
        }
        int startIndex = 0;
        int endIndex = nums.length - 1;
        int middleIndex;
        int minVal = nums[0];
        while (startIndex <= endIndex) {
            middleIndex = (startIndex + endIndex) / 2;
            // 以middle为界限，寻找一定有序的一边
            if (nums[startIndex] <= nums[middleIndex]) {// 左边是有序的
                minVal = Math.min(nums[startIndex], minVal);
                // 找到最小值后，将左边全部舍弃
                startIndex = middleIndex + 1;
            } else {// 右边是有序的，middle到endIndex一定是有序的
                minVal = Math.min(nums[middleIndex], minVal);
                // 找到最小值后，将右边（从middle）全部舍弃
                endIndex = middleIndex - 1;
            }
        }
        return minVal;
    }
}
