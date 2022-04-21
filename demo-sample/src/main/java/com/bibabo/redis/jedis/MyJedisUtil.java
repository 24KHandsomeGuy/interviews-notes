package com.bibabo.redis.jedis;

import redis.clients.jedis.Jedis;

/**
 * @author fukuixiang
 * @date 2021/4/19
 * @time 14:02
 * @description
 */
public abstract class MyJedisUtil {

    private static final String host = "10.254.128.133";

    private static final int port = 6380;

    private static Jedis jedis;

    static {
        jedis = new Jedis(host, port);
    }

    public static Jedis getJedis() {
        return jedis;
    }
}
