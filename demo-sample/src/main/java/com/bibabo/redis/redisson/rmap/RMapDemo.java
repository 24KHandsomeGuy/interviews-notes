package com.bibabo.redis.redisson.rmap;

import org.redisson.api.RMap;
import org.redisson.api.RedissonClient;
import redis.redisson.common.RedissonCommonUtil;

import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2020/7/17
 * @time 11:42
 * @description
 */
public class RMapDemo {

    public static void main(String[] args) {

        RedissonClient redissonClient = RedissonCommonUtil.start();
        RMap<String,Object> rMap = redissonClient.getMap("TEST-MAP-1");
        rMap.put("handOverId",602027922L);
        rMap.put("orderCnt",13);

        rMap.expire(10, TimeUnit.SECONDS);

        redissonClient.shutdown();
    }

}
