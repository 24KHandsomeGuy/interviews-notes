package com.bibabo.redis.redisson.lock;

import org.redisson.Redisson;
import org.redisson.api.RLock;
import org.redisson.api.RReadWriteLock;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2020/6/29
 * @time 19:06
 * @description
 */
public class RWLock4 {

    public static void main(String[] args) {
        Config config = new Config();
        List<String> url = Arrays.asList("redis://redis.uat.chunbo.com:26380");
        config.useSentinelServers()
                .addSentinelAddress(url.toArray(new String[0]))
                .setMasterName("mymaster")
                .setDatabase(8)
                .setMasterConnectionPoolSize(1)
                .setMasterConnectionMinimumIdleSize(1)
                .setSlaveConnectionPoolSize(1)
                .setSlaveConnectionMinimumIdleSize(1);
        RedissonClient redissonClient = Redisson.create(config);
        RReadWriteLock rReadWriteLock = redissonClient.getReadWriteLock("LOCK_GetLotStockNum_1");
        RLock readLock = rReadWriteLock.readLock();
        readLock.lock(20, TimeUnit.SECONDS);
        System.out.println("获得读锁成功2");

        readLock.unlock();
        /*readLock.unlock();
        readLock.unlock();
        readLock.unlock();*/
        redissonClient.shutdown();
    }
}
