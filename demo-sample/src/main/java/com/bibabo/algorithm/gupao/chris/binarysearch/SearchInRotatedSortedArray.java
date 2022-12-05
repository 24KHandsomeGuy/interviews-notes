package com.bibabo.algorithm.gupao.chris.binarysearch;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/3 11:20
 * @Description: 在旋转有序的数组中搜索
 * leetcode上一位大哥说道
 * 步骤1：数组一分为2，总有一边是一定有序的，而另一边可能有序，也可能部分有序。
 * 步骤2：如果目标值在有序的一边，二分查找法即可。
 * 若目标值在无序的一边，则循环步骤1。
 */
public class SearchInRotatedSortedArray {

    /**
     * 7 8 9 1 2 3 4
     *
     * @param nums
     * @param target
     * @return
     */
    public int search(int[] nums, int target) {
        if (nums == null || nums.length == 0) {
            return -1;
        }
        // 总有一边是一定有序的，另一边可能有序也可能无序。
        // 找到一定有序的一边，这个边可以准确的判断出，当前的target是否在这个边内。
        // 如若在，则继续在该边使用二分法查找；如若不在，则到另一边查找
        int startIndex = 0;
        int endIndex = nums.length - 1;
        int middleIndex;
        while (startIndex <= endIndex) {
            middleIndex = (endIndex - startIndex) / 2 + startIndex;
            if (target == nums[middleIndex]) {
                return middleIndex;
            }
            // 以middleIndex为界限，找到一定有序的一边
            // 这里nums[startIndex]也可以写成nums[0]
            if (nums[startIndex] <= nums[middleIndex]) {// 左边一定是升序的
                if (nums[startIndex] <= target && target < nums[middleIndex]) {// target在（一定升序）左边范围内
                    endIndex = middleIndex - 1;
                } else {// target在（不一定是否升序）右边范围内
                    startIndex = middleIndex + 1;
                }
            } else {// 右边一定是升序的
                if (nums[middleIndex] < target && target <= nums[endIndex]) {// target在（一定升序）右边范围内
                    startIndex = middleIndex + 1;
                } else {// target在（不一定是否升序）左边范围内
                    endIndex = middleIndex - 1;
                }
            }
        }
        return -1;
    }
}
