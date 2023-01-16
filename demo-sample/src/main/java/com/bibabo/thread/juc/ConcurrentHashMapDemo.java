package com.bibabo.thread.juc;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/1/12 16:01
 * @Description:
 */
public class ConcurrentHashMapDemo {

    public static void main(String[] args) {
        Map<String, String> map = new ConcurrentHashMap<>();
        map.put("1", "2");

        new LinkedBlockingQueue<>(1000000000);

        System.out.println(1 << (32 - 1));
    }
}
