package com.bibabo.redis.jedis;

import lombok.extern.slf4j.Slf4j;
import org.redisson.Redisson;
import org.redisson.api.BatchResult;
import org.redisson.api.RBatch;
import org.redisson.api.RBucketAsync;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisSentinelPool;
import redis.clients.jedis.Pipeline;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/**
 * @author fukuixiang
 * @date 2021/4/13
 * @time 10:06
 * @description jedis测试1 春播uat环境 sentinel
 */
@Slf4j
public class PipelineAddDemo {

    public static void main(String[] args) throws IOException {

        Set<String> sentinelNames = new HashSet<>();
        sentinelNames.add("redis.uat.chunbo.com:26381");

        JedisSentinelPool pool = new JedisSentinelPool("mymaster", sentinelNames, new JedisPoolConfig(), 100000, null, 3);
        Jedis jedis = pool.getResource();

        /*String setResult = jedis.set("fukuixiang", "hello");
        System.out.println(setResult);
        Long expireResult = jedis.expire("fukuixiang", 60);
        System.out.println(expireResult);*/

        String keyPrefix = "Pipleline-test-";
        int size = 10000;

        // 原生
        long startTimeMillis = System.currentTimeMillis();
        for (int i = 0;i < size;i ++){
            jedis.set(keyPrefix + i, i + "");
        }
        long endTimeMillis = System.currentTimeMillis();
        System.out.println("原生jedis一共执行多久 " + (endTimeMillis - startTimeMillis));

        // pipeline
        Pipeline pipeline = jedis.pipelined();
        long startTimeMillis2 = System.currentTimeMillis();
        for (int i = size;i < size * 2;i ++){
            pipeline.set(keyPrefix + i, i + "");
        }
        pipeline.sync();
        long endTimeMillis2 = System.currentTimeMillis();
        System.out.println("jedis的pipeline一共执行多久  " + (endTimeMillis2 - startTimeMillis2) );

        long startTimeMillis3 = System.currentTimeMillis();
        Config config = new Config();
        config.useSentinelServers().addSentinelAddress("redis://redis.uat.chunbo.com:26381")
                .setMasterName("mymaster")
                .setDatabase(3);
        RedissonClient redissonClient = Redisson.create(config);
        RBatch rBatch = redissonClient.createBatch();
        for (int i = size * 2;i < size * 3;i ++){
            RBucketAsync<String> rBucket = rBatch.getBucket(keyPrefix + i);
            rBucket.setAsync(i + "");
        }
        BatchResult result = rBatch.execute();
        long endTimeMillis3 = System.currentTimeMillis();
        System.out.println("redisson的pipeline一共执行多久  " + (endTimeMillis3 - startTimeMillis3) );

        pipeline.close();
        jedis.close();
        redissonClient.shutdown();

    }

}
