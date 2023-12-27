package com.bibabo.java8.stream;

import cn.hutool.core.collection.CollUtil;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/12/21 17:25
 * @Description
 */
public class CollectionCollectTest2 {

    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);

        List<Integer> list2 = new ArrayList<>();
        list2.add(1);
        list2.add(2);
        /*System.out.println(list.containsAll(list2));

        System.out.println();

        System.out.println(list.containsAll(list2));*/


        Collection<Integer> disjunction = CollUtil.disjunction(list, list2);
        System.out.println(disjunction);
    }
}
