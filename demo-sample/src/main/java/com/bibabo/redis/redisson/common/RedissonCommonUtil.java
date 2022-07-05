package com.bibabo.redis.redisson.common;

import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.redisson.config.SentinelServersConfig;

import java.util.Arrays;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2020/7/17
 * @time 11:37
 * @description
 */
public abstract class RedissonCommonUtil {

    public static RedissonClient start() {
        Config config = new Config();
        List<String> urls = Arrays.asList("redis://redis.uat.chunbo.com:26380");
        SentinelServersConfig serversConfig = config.useSentinelServers()
                .addSentinelAddress(urls.toArray(new String[0]))
                .setMasterName("mymaster").setDatabase(8)
                .setMasterConnectionPoolSize(1).setMasterConnectionMinimumIdleSize(1)
                .setSlaveConnectionPoolSize(1).setSlaveConnectionMinimumIdleSize(1);
        RedissonClient redissonClient = Redisson.create(config);

        return redissonClient;
    }

    public static RedissonClient aliyunStart() {
        Config config = new Config();
        config.useSingleServer()
                .setAddress("redis://39.107.156.177:6379")
                .setPassword("123456")
                .setDatabase(1)
                .setConnectionMinimumIdleSize(1)
                .setConnectionPoolSize(2);
        RedissonClient redissonClient = Redisson.create(config);

        return redissonClient;
    }

    public static boolean shutdown(RedissonClient redissonClient) {
        if (null == redissonClient) {
            return false;
        }
        try {
            redissonClient.shutdown();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

}
