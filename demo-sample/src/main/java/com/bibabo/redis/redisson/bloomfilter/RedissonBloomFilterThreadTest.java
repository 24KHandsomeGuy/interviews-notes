package com.bibabo.redis.redisson.bloomfilter;

import org.redisson.api.RBloomFilter;
import org.redisson.api.RedissonClient;
import redis.redisson.common.RedissonCommonUtil;

/**
 * @author fukuixiang
 * @date 2020/7/16
 * @time 11:39
 * @description 30w数据 总时长：1477460
 */
public class RedissonBloomFilterThreadTest {

    public static void main(String[] args) {
        int expectedInsertions = 1000;//预期会存放到布隆里的的大小
        RedissonClient redissonClient = RedissonCommonUtil.start();

        RBloomFilter<Integer> rBloomFilter = redissonClient.getBloomFilter("DEMO_FILTER_2");
        System.out.println(rBloomFilter.tryInit(expectedInsertions,0.05));
        long startMillis = System.currentTimeMillis();

        /*// 1000数据5s
        for (int i = 0; i < expectedInsertions;i ++) {
            rBloomFilter.add(i);//向布隆过滤器添加
        }*/
        // 1000数据5s
        for (int i = 0; i < expectedInsertions;i ++) {
            rBloomFilter.contains(i);//向布隆过滤器读取
        }
        long endMillis = System.currentTimeMillis();
        System.err.println("总时长：" + (endMillis - startMillis));
        RedissonCommonUtil.shutdown(redissonClient);
    }

}
