package com.bibabo.algorithm.leetcode.No4MedianOfTwoSortedArrays;

import java.util.Arrays;
import java.util.stream.Stream;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/28 15:12
 * @Description:
 */
public class Test {

    public static void main(String[] args) {
        System.out.println(3 / 2);
        MedianOfTwoSortedArrays02 median = new MedianOfTwoSortedArrays02();
        Stream.of(median.findMedianSortedArrays(new int[]{1,3},new int[]{2})).forEach(System.out::println);
    }
}
