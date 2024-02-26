package com.bibabo.redis.jedis.delayQueue;

import com.alibaba.fastjson.JSONObject;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.util.ArrayList;
import java.util.Set;
import java.util.UUID;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/2/22 16:28
 * @Description 分布式时间轮实现
 */
public class DelayQueueDemo {

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
        String pageId1 = UUID.randomUUID().toString();
        jedis.zadd(queueKey, System.currentTimeMillis() + 5000, pageId1);

        String pageId2 = UUID.randomUUID().toString();
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
            // 只获取第一条数据, 只获取不会移除数据
            Set<String> resultList = jedis.zrangeByScore(queueKey, System.currentTimeMillis() - 1000 * 60 * 60, System.currentTimeMillis() + 1);
            System.out.println(JSONObject.toJSONString(resultList));
            if (resultList.size() == 0) {
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                    break;
                }
            } else {
                // 移除数据获取到的数据
                for (String pageId : resultList) {
                    if (jedis.zrem(queueKey, pageId) > 0) {
                        handleMsg(pageId);
                    } else {
                        System.out.println("移除失败" + pageId);
                    }
                }
            }
        }
    }

    public static void handleMsg(String msg) {
        System.out.println("接受消息：" + msg);
    }
}
