package com.bibabo.redis.redisson.atomic;

import org.redisson.api.RAtomicLong;
import org.redisson.api.RedissonClient;
import redis.redisson.common.RedissonCommonUtil;

/**
 * @author fukuixiang
 * @date 2020/7/28
 * @time 10:00
 * @description
 */
public class AtomicLongDemo {

    public static void main(String[] args) {

        RedissonClient redissonClient = RedissonCommonUtil.start();
        RAtomicLong atomicLong = redissonClient.getAtomicLong("ccc");
        System.out.println(atomicLong.get());
        System.out.println(atomicLong.incrementAndGet());
        redissonClient.shutdown();

    }

}