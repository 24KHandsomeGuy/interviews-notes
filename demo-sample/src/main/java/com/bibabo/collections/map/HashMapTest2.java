package com.bibabo.collections.map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/6/7 10:07:56
 * @Description
 */
public class HashMapTest2 {


    public static void main(String[] args) {
        Map<Integer, ReentrantLock> map = new HashMap<>();
        for (int i = 0;i < 100;i ++) {
            new Thread(() -> {
                //ReentrantLock lock = map.putIfAbsent(1, new ReentrantLock());
                map.putIfAbsent(1, new ReentrantLock());
                System.out.println(map.get(1));
            }).start();
        }

    }
}
