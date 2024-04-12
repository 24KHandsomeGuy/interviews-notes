package com.bibabo.redis.jedis;

import com.alibaba.fastjson.JSON;
import org.apache.commons.lang.StringUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.Response;
import redis.clients.jedis.Transaction;

import java.util.List;
import java.util.concurrent.CyclicBarrier;

/**
 * @author fukuixiang
 * @date 2021/4/13
 * @time 16:36
 * @description
 */
public class JedisStockTransactionDemo {
    public static void main(String[] args) {
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMinIdle(50);
        config.setMaxIdle(50);
        config.setMaxWaitMillis(10000);
        config.setTestOnBorrow(false);
        config.setTestOnReturn(false);
        JedisPool jedisPool = new JedisPool(config, "39.107.156.177", 6379, 5000, "123456", 0);


        int cyclicBarrierNum = 3;
        CyclicBarrier cyclicBarrier = new CyclicBarrier(cyclicBarrierNum);

        for (int i = 0; i < cyclicBarrierNum; i++) {
            Thread thread = new Thread(() -> {
                try {
                    cyclicBarrier.await();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                System.out.println(Thread.currentThread().getName() + "开始执行");
                Jedis jedis = jedisPool.getResource();
                jedis.watch("stock");
                String stock = jedis.get("stock");
                int stockInt = Integer.parseInt(stock);
                if (StringUtils.isBlank(stock) || stockInt <= 0) {
                    System.out.println(Thread.currentThread().getName() + "库存为空");
                    jedis.close();
                    return;
                }
                Transaction transaction = jedis.multi();
                try {
                    transaction.set("stock", String.valueOf(stockInt - 1));
                    System.out.println(Thread.currentThread().getName() + "库存减少成功");
                    List<Object> redisResult = transaction.exec();
                    if (redisResult == null || redisResult.isEmpty()) {
                        System.out.println(Thread.currentThread().getName() + "执行失败，结果：" + JSON.toJSONString(redisResult));
                    } else {
                        System.out.println(Thread.currentThread().getName() + "执行成功，结果：" + JSON.toJSONString(redisResult));
                    }
                } catch (RuntimeException e) {
                    e.printStackTrace();
                    System.out.println(Thread.currentThread().getName() + "回滚");
                    transaction.discard();
                } finally {
                    jedis.unwatch();
                    jedis.close();
                }
            });
            thread.setName("thread-" + i);
            thread.start();
        }
    }
}
