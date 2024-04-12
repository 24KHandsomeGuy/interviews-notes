package com.bibabo.redis.jedis;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @author fukuixiang
 * @date 2021/4/19
 * @time 13:53
 * @description
 *
 * redis的五种数据类型
 * String int、float、string
 */
public class JedisTest {

    public static void main(String[] args) {

        JedisPoolConfig config = new JedisPoolConfig();
        config.setMinIdle(10);
        config.setMaxIdle(10);
        config.setMaxWaitMillis(10000);
        config.setTestOnBorrow(false);
        config.setTestOnReturn(false);
        JedisPool jedisPool = new JedisPool(config, "39.107.156.177", 6379, 5000, "123456", 0);

        System.out.println(jedisPool.getResource().decr("stock"));
    }

}
