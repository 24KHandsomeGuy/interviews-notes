package com.bibabo.redis.jedis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisSentinelPool;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author fukuixiang
 * @date 2021/8/4
 * @time 15:01
 * @description
 */
public class JedisLuaDemo {

    public static void main(String[] args) {

        Set<String> sentinelNames = new HashSet<>();
        sentinelNames.add("redis.uat.chunbo.com:26381");

        JedisSentinelPool pool = new JedisSentinelPool("mymaster", sentinelNames, new JedisPoolConfig(), 100000, null, 3);
        Jedis jedis = pool.getResource();

        //Object result = jedis.eval("redis.call('SET', KEYS[1], ARGV[1]);redis.call('SET', KEYS[2], ARGV[2]);", 2, "ORDER_STATUS_UPDATE_184970490977_3008", "ORDER_STATUS_UPDATE_184970490977_3009", "10", "100");
        List<String> keyList = Arrays.asList("ORDER_STATUS_UPDATE_184970490977_13008", "ORDER_STATUS_UPDATE_184970490977_13009");
        List<String> argvList = Arrays.asList("001","");
        //Object result = jedis.eval("redis.call('SETNX60', KEYS[1], ARGV[1]);redis.call('EXPIRE', KEYS[1], ARGV[3]);redis.call('SETNX', KEYS[2], ARGV[2]);", keyList, argvList);
        Object result = jedis.eval("local rst = redis.call('SETNX', KEYS[1], ARGV[1]);if(rst == 1) then redis.call('EXPIRE', KEYS[1], ARGV[2]) end;return rst;", keyList, argvList);
        System.out.println((Long) result);

        System.out.println(jedis.get("ORDER_STATUS_UPDATE_184970490977_3008"));
        System.out.println(jedis.get("ORDER_STATUS_UPDATE_184970490977_3009"));
        jedis.close();
        pool.destroy();
    }

}
