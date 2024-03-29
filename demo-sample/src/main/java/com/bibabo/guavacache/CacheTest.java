package com.bibabo.guavacache;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/6/5 13:43:36
 * @Description
 */
public class CacheTest {

    public static void main(String[] args) throws InterruptedException {
        /*Cache<Integer, List<Integer>> cache = CacheBuilder.newBuilder().maximumSize(100000).expireAfterWrite(5, TimeUnit.SECONDS).build();
        cache.put(1, Arrays.asList(1, 2, 3));
        // guava缓存不支持存空值NullPointerException
        // cache.put(2, null);
        cache.put(2, new ArrayList<>(0));
        System.out.println(cache.asMap().get(1));
        System.out.println(cache.asMap().get(2));

        TimeUnit.SECONDS.sleep(6);
        System.out.println(cache.asMap().get(1));*/

        Cache<GuavaObject, Integer> cache = CacheBuilder.newBuilder().maximumSize(100000).expireAfterWrite(5, TimeUnit.SECONDS).build();
        GuavaObject guavaObject = new GuavaObject();
        guavaObject.setId(10086L);
        guavaObject.setName(new String("aaa"));
        cache.put(guavaObject, 1);

        GuavaObject guavaObject2 = new GuavaObject();
        guavaObject2.setId(10086L);
        guavaObject2.setName(new String("aaa"));
        cache.put(guavaObject2, 2);

        GuavaObject guavaObject3 = new GuavaObject();
        guavaObject3.setId(10086L);
        guavaObject3.setName(new String("bbb"));
        cache.put(guavaObject3, 3);

        System.out.println(cache.asMap());
    }
}
