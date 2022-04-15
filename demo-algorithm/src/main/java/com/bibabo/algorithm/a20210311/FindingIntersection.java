package com.bibabo.algorithm.a20210311;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * @author fukuixiang
 * @date 2021/3/11
 * @time 10:03
 * @description 求两个数组交集，并且返回的结果不能有重复元素
 */
public class FindingIntersection {

    public static void main(String[] args) {
        int[] arr1 = new int[]{5,7,9,4,10,10,4,3};
        int[] arr2 = new int[]{4,3,100};

        for (int i : findingIntersection2(arr1, arr2)) {
            System.out.println(i);
        }

    }


    // 第一种方法 使用hash表 降低时间复杂度为O(n)
    // 因为set的存储，使用的是map的key，contains方法的时间复杂度为O(1)
    static int[] findingIntersection(int[] arr1, int[] arr2) {
        if (arr1 == null || arr1.length == 0 || arr2 == null || arr2.length == 0) {
            return null;
        }
        if (arr1.length > arr2.length) {
            return findingIntersection(arr2, arr1);
        }
        Set<Integer> set1 = new HashSet<>();
        for (int i = 0; i < arr1.length; i ++) {
            set1.add(arr1[i]);
        }
        Set<Integer> set2 = new HashSet();
        for (int i = 0; i < arr2.length; i ++) {
            set2.add(arr2[i]);
        }

        set1.removeIf(e -> !set2.contains(e)); // set2不包含e 要删除

        int[] result = new int[set1.size()];
        int index = 0;
        for (Integer e : set1) {
            result[index ++] = e;
        }

        return result;
    }

    // 先排好序 值小的不断移动下标
    static int[] findingIntersection2(int[] arr1, int[] arr2) {
        if (arr1 == null || arr1.length == 0 || arr2 == null || arr2.length == 0) {
            return null;
        }
        Arrays.sort(arr1);
        Arrays.sort(arr2);

        int length1 = arr1.length;
        int length2 = arr2.length;

        int index1 = 0;
        int index2 = 0;

        int index = 0;

        int[] result = new int[length1 > length2 ? length2 : length1];

        while (index1 < length1 && index2 < length2) {
            if (arr1[index1] < arr2[index2]) {
                index1 ++;
                continue;
            }
            if (arr1[index1] > arr2[index2]) {
                index2 ++;
                continue;
            }
            if (index == 0 || result[index - 1] != arr1[index1]) {
                result[index] = arr1[index1];
                index ++;
            }
            index1 ++;
            index2 ++;
        }

        return result.length == index ? result : Arrays.copyOf(result, index);
    }

}
