package com.bibabo.redis.jedis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisSentinelPool;

import java.util.HashSet;
import java.util.Set;

/**
 * @author fukuixiang
 * @date 2021/8/4
 * @time 15:01
 * @description
 */
public class JedisDemo {

    public static void main(String[] args) {

        // wms
        Set<String> sentinelNames = new HashSet<>();
        sentinelNames.add("redis.uat.chunbo.com:26380");
        // oms
        //sentinelNames.add("redis.uat.chunbo.com:26381");

        JedisSentinelPool pool = new JedisSentinelPool("mymaster", sentinelNames, new JedisPoolConfig(), 100000, null, 8);
        Jedis jedis = pool.getResource();
        System.out.println(jedis.get("DEMO_FILTER_1"));

        jedis.close();
        pool.destroy();
    }

}
