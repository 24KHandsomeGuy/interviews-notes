package com.bibabo.collections.map;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class TreeMapTest {

    public static void main(String[] args) {

        /*TreeMap<Integer, Integer> map = new TreeMap<>();

        map.put(212, 1);
        map.put(22342, 2);
        map.put(444, 3);
        map.put(345, 4);
        map.put(3453, 5);
        map.put(33, 6);
        map.put(44, 7);
        map.put(111, 8);
        map.put(556, 9);
        map.put(7889, 10);
        map.put(89564, 11);
        map.put(3435, 12);
        map.put(13, 13);
        map.put(14, 14);
        map.put(15, 15);
        map.put(16, 16);
        map.put(17, 17);
        map.put(18, 18);
        map.put(19, 19);

        map.forEach((k, v) -> System.out.println("key:" + k + "---value:" + v));*/

        TreeMap<Demo, Integer> map = new TreeMap<>();
        map.put(new Demo(1 ,"1"), 2);

    }
}
