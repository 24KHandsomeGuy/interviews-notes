package com.bibabo.guavacache;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.collect.Sets;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/6/5 13:43:36
 * @Description
 */
public class CacheTest2 {
    /**
     * 商家秒杀品本地缓存
     */
    private static Cache<Long, Set<String>> secKillSkusCache = CacheBuilder.newBuilder().maximumSize(20000)
            .expireAfterWrite(5*60, TimeUnit.SECONDS)
            .build();
    public static void main(String[] args) throws InterruptedException, ExecutionException {

        for (int i = 0; i < 100; i++) {
            new Thread(() -> {
                Set<String> allSecKillSKuListByLocalCache = getAllSecKillSKuListByLocalCache(1L);
                System.out.println(allSecKillSKuListByLocalCache);
            }).start();
        }


    }

    private static Set<String> getAllSecKillSKuListByLocalCache(Long vendorId) {
        Set<String> seckillSkuList = Sets.newHashSet();
        try {
            seckillSkuList = secKillSkusCache.get(vendorId, () -> {
                Set<String> allSecKillSKus = new HashSet<>();
                allSecKillSKus.add(String.valueOf(new Random().nextInt(1000)));
                System.out.println("获取商家秒杀品列表成功");
                secKillSkusCache.put(vendorId, allSecKillSKus);
                return allSecKillSKus;
            });
        } catch (Exception e) {
            System.out.println("获取商家秒杀品列表失败");
        }
        return seckillSkuList;
    }
}
