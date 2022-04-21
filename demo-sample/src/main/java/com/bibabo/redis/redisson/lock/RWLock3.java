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
public class RWLock3 {

    public static void main(String[] args) throws InterruptedException {
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
        RLock writeLock = rReadWriteLock.writeLock();
        writeLock.lock(1, TimeUnit.SECONDS);
        System.out.println("获得写锁成功---2");


        writeLock.unlock();
        writeLock.unlock();
        System.out.println("释放写锁成功---2");

        redissonClient.shutdown();
    }
}
