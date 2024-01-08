package com.bibabo.reference;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/1/8 11:07
 * @Description
 */
public class SoftHashMapDemo {

    public static void main(String[] args) {

        Cache<String, String> cache = CacheBuilder.newBuilder().build();
        cache.put("10086", "10086");
        cache.put("10087", "10087");

        ConcurrentMap<String, String> concurrentHashMap = cache.asMap();
        System.out.println(concurrentHashMap);
    }

}
