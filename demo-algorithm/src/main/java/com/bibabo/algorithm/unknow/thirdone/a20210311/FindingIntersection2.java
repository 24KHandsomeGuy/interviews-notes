package com.bibabo.algorithm.unknow.thirdone.a20210311;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * @author fukuixiang
 * @date 2021/3/11
 * @time 10:03
 * @description 求两个数组交集，并且返回的结果不能有重复元素
 */
public class FindingIntersection2 {

    /*public static void main(String[] args) {
        int[] arr1 = new int[]{5,7,9,4,10,10,4,3};
        int[] arr2 = new int[]{4,4,3,100};

        for (int i : findingIntersection(arr1, arr2)) {
            System.out.println(i);
        }

    }*/

    public static void main(String[] args) {
        char[] chars1 = new char[]{'a', 'b', 'd', 'g', 'h'};
        char[] chars2 = new char[]{'a', 'b', 'd', 'h'};

        System.out.println(method(chars1, chars2));

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
        Map<Integer, Integer> map = new HashMap<>();// key:数组元素值 value:出现的计数
        for (int i : arr1) {
            if (map.containsKey(i)) {
                map.put(i, map.get(i) + 1);
            } else {
                map.put(i, 1);
            }
        }

        int[] result = new int[arr1.length];
        int index = 0;
        for (int i : arr2) {
            if (map.containsKey(i)) {
                int count = map.get(i) - 1;
                if (count >= 0) {// 超过最小值了
                    map.put(i, count);
                    result[index++] = i;
                }
            }

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
            index1 ++;
            index2 ++;
            result[index ++] = arr1[index1];
        }

        return result;
    }


    // 已知chars1是大数组
    static char method(char[] chars1, char[] chars2) {
        if (chars1 == null || chars1.length == 0 || chars2 == null || chars2.length == 0) {
            throw new NullPointerException();
        }
        if (chars1.length < chars2.length) {
            return method(chars2, chars1);
        }

        for (int i = 0; i < chars2.length; i ++) {
            if (chars1[i] != chars2[i]) {
                return chars1[i];
            }
        }
        return chars1[chars1.length - 1];
    }

}
