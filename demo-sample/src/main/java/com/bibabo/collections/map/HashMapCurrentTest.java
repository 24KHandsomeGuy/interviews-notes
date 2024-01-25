package com.bibabo.collections.map;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/1/9 13:53
 * @Description
 */
public class HashMapCurrentTest {

    public static void main(String[] args) throws InterruptedException {
        Map<String, String> map = new HashMap<>();

        for (int i = 0; i < 100000; i++) {
            final int j = i;
            new Thread(() -> {
                map.put(String.valueOf(j), String.valueOf(j));
            }).start();
        }

        TimeUnit.SECONDS.sleep(2);
        System.out.println(map.size());
    }
}
