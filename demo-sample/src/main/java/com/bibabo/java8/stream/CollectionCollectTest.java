package com.bibabo.java8.stream;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/12/21 17:25
 * @Description
 */
public class CollectionCollectTest {

    public static void main(String[] args) {
        Map<Integer, List<Integer>> map = new HashMap<>();
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);

        List<Integer> list2 = new ArrayList<>();
        list2.add(4);
        list2.add(5);
        list2.add(6);

        List<Integer> list3 = new ArrayList<>();
        list3.add(4);
        list3.add(5);
        list3.add(6);
        map.put(1, list);
        map.put(2, list2);
        map.put(3, list3);

        List<Integer> list4 = map.values().stream().collect(ArrayList::new, List::addAll, List::addAll);
        System.out.println(list4);
    }
}
