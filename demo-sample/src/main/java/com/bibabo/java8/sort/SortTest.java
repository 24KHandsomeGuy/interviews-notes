package com.bibabo.java8.sort;

import com.google.common.collect.Lists;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/2/19 11:06
 * @Description
 */
public class SortTest {

    public static void main(String[] args) {

        List<Integer> list = Lists.newArrayList(8, 2, 3, 4, 5, 6, 7, 1, 9, 10);

        // 正数则调换位置
        list.sort((o1, o2) -> o1 - o2);

        System.out.println(list);
    }
}
