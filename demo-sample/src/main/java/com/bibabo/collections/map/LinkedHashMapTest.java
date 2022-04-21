package com.bibabo.collections.map;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author fukuixiang
 * @date 2020/9/18
 * @time 10:13
 * @description
 */
public class LinkedHashMapTest {

    public static void main(String[] args) {

        LinkedHashMap<Integer,Integer> map = new LinkedHashMap(16, (float) 0.75, true);

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

        map.get(44);

        // linkedHashMap
        // 基于hashMap的存储结构上，增加了双向链表，链表的主要目的在于保证存储元素的顺序
        /*Iterator<Map.Entry<Integer, Integer>> entryIterator = map.entrySet().iterator();
        while (entryIterator.hasNext()) {
            Map.Entry entry = entryIterator.next();
            entry.getKey();
            System.out.println(entry.getValue());
        }*/

        map.forEach((k, v) -> System.out.println("key:" + k + "---value:" + v));

    }

}
