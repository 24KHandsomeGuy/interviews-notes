package com.bibabo.algorithm.firstone;

import java.util.HashMap;
import java.util.Map;

/**
 * @author fukuixiang
 * @date 2020/9/10
 * @time 9:40
 * @description 在数组中找到 两数之和等于所需目标数的下标
 */
public class ReturnIndexForAddArrTowNumbers {

    public static void main(String[] args) {

        int[] nums = new int[] {2,5,8,3,4,6};

        int target = 9;

        long start = System.currentTimeMillis();
        method3(nums,target);
        long end = System.currentTimeMillis();
        long diff = end - start;
        System.out.println("time:" + diff);



        //method2(nums,target);
        //method3(nums,target);
    }

    /**
     * the solution of violence
     * time complexity O(n*n)
     * space complexity O(1)
     * @param nums
     * @param target
     * @return
     */
    public static int[] method1(int[] nums,int target) {

        for (int i = 0;i < nums.length;i ++) {

            for (int j= i + 1 ;j < nums.length;j ++) {

                if (nums[i] + nums[j] == target) {
                    System.out.println(i);
                    System.out.println(j);
                    return new int[]{i,j};
                }
            }
        }
        throw new RuntimeException();
    }

    /**
     * twice map
     * time complexity O(n)
     * space complexity O(n)
     * because the time complexity of search map element is O(1)
     * and map use extra space to store temporary element,space complexity is O(n)
     * @param nums
     * @param target
     * @return
     */
    public static int[] method2(int[] nums,int target) {

        Map<Integer,Integer> map = new HashMap<Integer, Integer>();
        for (int i = 0;i < nums.length;i ++) {
            map.put(nums[i],i);
        }

        for (int i = 0;i < nums.length;i ++) {
            if (map.containsKey(target - nums[i]) && i != map.get(target - nums[i])) {
                System.out.println(i);
                System.out.println(map.get(target - nums[i]));
                return new int[]{i,map.get(target - nums[i])};
            }
        }
        throw new RuntimeException();
    }

    /**
     * once map
     * time complexity O(n)
     * space complexity O(n)
     * @param nums
     * @param target
     * @return
     */
    public static int[] method3(int[] nums,int target) {

        Map<Integer,Integer> map = new HashMap<Integer, Integer>();
        for (int i = 0;i < nums.length;i ++) {
            if (map.get(target - nums[i]) == null) {
                map.put(nums[i],i);
            } else {
                System.out.println(i);
                System.out.println(map.get(target - nums[i]));
                return new int[]{i,map.get(target - nums[i])};
            }
        }
        throw new RuntimeException();
    }

}
