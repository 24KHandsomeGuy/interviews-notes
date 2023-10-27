package com.bibabo.guavacache;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/6/5 13:43:36
 * @Description
 */
public class CachelistTest {

    public static void main(String[] args) throws InterruptedException {

        Cache<GuavaObjectOuter, Integer> cache = CacheBuilder.newBuilder().maximumSize(100000).expireAfterWrite(5, TimeUnit.SECONDS).build();
        GuavaObjectOuter guavaObjectOuter = new GuavaObjectOuter();
        List<GuavaObject> guavaObjects = new ArrayList<>();
        guavaObjectOuter.setGuavaObjects(guavaObjects);
        GuavaObject guavaObject = new GuavaObject();
        guavaObject.setId(10086L);
        guavaObject.setName(new String("aaa"));
        guavaObjects.add(guavaObject);

        GuavaObject guavaObject2 = new GuavaObject();
        guavaObject2.setId(10087L);
        guavaObject2.setName(new String("bbb"));
        guavaObjects.add(guavaObject2);

        GuavaObjectOuter guavaObjectOuter2 = new GuavaObjectOuter();
        List<GuavaObject> guavaObjects2 = new ArrayList<>();
        guavaObjectOuter2.setGuavaObjects(guavaObjects2);
        GuavaObject guavaObject11 = new GuavaObject();
        guavaObject11.setId(10086L);
        guavaObject11.setName(new String("aaa"));
        guavaObjects2.add(guavaObject11);

        GuavaObject guavaObject22 = new GuavaObject();
        guavaObject22.setId(10087L);
        guavaObject22.setName(new String("bbb"));
        guavaObjects2.add(guavaObject22);


        cache.put(guavaObjectOuter, 1);
        cache.put(guavaObjectOuter2, 2);
        System.out.println(cache.asMap());
    }
}
