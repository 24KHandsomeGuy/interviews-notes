package com.bibabo.collections.list;

import java.util.Arrays;

/**
 * @author fukuixiang
 * @date 2020/9/21
 * @time 11:41
 * @description
 */
public class ArrayTest {

    public static void main(String[] args) {

        int[] nums = new int[8];
        nums[0] = 10;
        nums[1] = 11;
        nums[2] = 12;
        nums[3] = 13;
        nums[4] = 14;
        for (int num : nums) {
            System.out.println(num);
        }

        int[] nums2 = new int[3];
        System.arraycopy(nums,1,nums2,0,3);
        //System.arraycopy(nums,1,nums2,0,4);
        System.arraycopy(nums,2,nums2,0,2);

        for (int num : nums2) {
            System.out.println(num);
        }

        int[] nums3 = Arrays.copyOf(nums,10);
        for (int num : nums3) {
            System.out.println(num);
        }
    }

}
