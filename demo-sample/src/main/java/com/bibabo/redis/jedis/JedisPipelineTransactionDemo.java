package com.bibabo.redis.jedis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisSentinelPool;
import redis.clients.jedis.Pipeline;

import java.util.HashSet;
import java.util.Set;

/**
 * @author fukuixiang
 * @date 2021/4/13
 * @time 16:36
 * @description
 */
public class JedisPipelineTransactionDemo {

    public static void main(String[] args) {

        Set<String> sentinelNames = new HashSet<>();
        sentinelNames.add("redis.uat.chunbo.com:26381");

        JedisSentinelPool pool = new JedisSentinelPool("mymaster", sentinelNames, new JedisPoolConfig(), 100000, null, 3);
        Jedis jedis = pool.getResource();

        Pipeline pipeline = jedis.pipelined();
        // pipeline 开启事务
        pipeline.multi();
        try {
            for (int i = 0;i < 100;i ++){
                pipeline.set("Transaction-Pipleline-test-" + i, i + "");
            }
            int i = 1 / 0;
            System.out.println("执行");
            pipeline.exec();
        } catch (RuntimeException e) {
            System.out.println("回滚");
            pipeline.discard();
        }
        pipeline.sync();
    }


}
