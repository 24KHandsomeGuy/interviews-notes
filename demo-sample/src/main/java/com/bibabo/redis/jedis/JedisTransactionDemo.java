package com.bibabo.redis.jedis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisSentinelPool;
import redis.clients.jedis.Transaction;

import java.util.HashSet;
import java.util.Set;

/**
 * @author fukuixiang
 * @date 2021/4/13
 * @time 16:36
 * @description
 */
public class JedisTransactionDemo {

    public static void main(String[] args) {

        Set<String> sentinelNames = new HashSet<>();
        sentinelNames.add("redis.uat.chunbo.com:26381");

        JedisSentinelPool pool = new JedisSentinelPool("mymaster", sentinelNames, new JedisPoolConfig(), 100000, null, 3);
        Jedis jedis = pool.getResource();

        Transaction transaction = jedis.multi();
        try {
            transaction.set("fukuixiang-01", "18511693916");
            transaction.set("fukuixiang-02", "18511693916");
            //int i = 1 / 0;
            transaction.set("fukuixiang-03", "18511693916");
            System.out.println("执行");
            transaction.exec();
        } catch (RuntimeException e) {
            System.out.println("回滚");
            transaction.discard();
        }
    }


}
