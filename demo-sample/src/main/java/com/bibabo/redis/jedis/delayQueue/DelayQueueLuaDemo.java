package com.bibabo.redis.jedis.delayQueue;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.UUID;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/2/22 16:28
 * @Description 分布式时间轮实现
 */
public class DelayQueueLuaDemo {

    public static void main(String[] args) {
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMinIdle(10);
        config.setMaxIdle(10);
        config.setMaxWaitMillis(10000);
        config.setTestOnBorrow(false);
        config.setTestOnReturn(false);
        Jedis jedis = new JedisPool(config, "39.107.156.177", 6379, 5000, "123456", 14).getResource();

        String queueKey = "delay_queue";

        // 实际开发建议使用业务 ID 和随机生成的唯一 ID 作为 value, 随机生成的唯一 ID 可以保证消息的唯一性, 业务 ID 可以避免 value 携带的信息过多
        String pageId1 = "10086";
        jedis.zadd(queueKey, System.currentTimeMillis() + 5000, pageId1);

        String pageId2 = "10087";
        jedis.zadd(queueKey, System.currentTimeMillis() + 5000, pageId2);

        new Thread(() -> {
            handleDelayQueue(jedis, queueKey);
        }).start();


        /*new Thread(() -> {
            handleDelayQueue(jedis, queueKey);
        }).start();*/
    }

    public static void handleDelayQueue(Jedis jedis, String queueKey) {
        while (true) {
            String luaScript = "local resultArray = redis.call('zrangebyscore', KEYS[1], 0, ARGV[1], 'limit', 0, 100)\n" +
                    "if #resultArray > 0 then\n" +
                    "    if redis.call('zrem', KEYS[1], resultArray) > 0 then\n" +
                    "        return resultArray[1]\n" +
                    "    else\n" +
                    "        return ''\n" +
                    "    end\n" +
                    "else\n" +
                    "    return ''\n" +
                    "end";

            Object result = jedis.eval(luaScript, Collections.singletonList(queueKey), Collections.singletonList(String.valueOf(System.currentTimeMillis())));
            System.out.println("获取到的数据：" + result);
            if (result == null) {
                System.out.println("没有获取到数据");
                continue;
            }
            handleMsg(result.toString());
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
                break;
            }
        }
    }

    public static void handleMsg(String msg) {
        System.out.println("接受消息：" + msg);
    }
}
