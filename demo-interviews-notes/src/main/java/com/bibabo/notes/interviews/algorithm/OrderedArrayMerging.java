package com.bibabo.notes.interviews.algorithm;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/27 13:42
 * @Description
 */
public class OrderedArrayMerging {

    public static void sort(List<Integer> list1, List<Integer> list2) {
        // 1. 合并两个有序数组
        list1.addAll(list2);
        //list1.stream().distinct().sorted().forEach(System.out::print);
    }

    public static void sort2(List<Integer> list1, List<Integer> list2) {
        Set<Integer> list = new HashSet<>();
        for (int i = 0; i < list2.size(); i++) {
            for (int j = 0; j < list1.size(); j++) {
                if (list2.get(i) < list1.get(j)) {
                    list.add(list2.get(i));
                    break;
                } else {
                    list.add(list1.get(j));
                }
            }
        }
        System.out.println(list);
    }

    public static void main(String[] args) {
        List<Integer> arr = new ArrayList<>(Arrays.asList(1, 3, 5));
        List<Integer> arr2 = new ArrayList<>(Arrays.asList(1, 3, 6));
        /*sort(arr, arr2);
        System.out.println("==============");
        sort2(arr, arr2);*/

        sort3(arr, arr2);
    }

    public static void sort3(List<Integer> list1, List<Integer> list2) {
        if (list1 == null || list1.isEmpty() || list2 == null || list2.isEmpty()) {
            return;
        }
        List<Integer> finalList = new ArrayList<>(list1.size() + list2.size());
        int i = list1.size(), j = list2.size();
        int k = 0;
        int m = 0;
        while (k < i && m < j) {
            int i1 = list1.get(k);
            int i2 = list2.get(m);
            if (i1 < i2) {
                finalList.add(i1);
                k++;
            } else if (i1 > i2) {
                finalList.add(i2);
                m++;
            } else {
                finalList.add(i2);
                k++;
                m++;
            }
        }
        while (i - k > 0) {
            finalList.add(list1.get(k));
            k++;
        }
        while (j - m > 0) {
            finalList.add(list2.get(m));
            m++;
        }
        System.out.println(finalList);
    }
}
