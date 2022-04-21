package com.bibabo.redis.redisson.bloomfilter;

import com.bibabo.redis.redisson.common.RedissonCommonUtil;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RedissonClient;

/**
 * @author fukuixiang
 * @date 2020/7/16
 * @time 11:39
 * @description
 */
public class RedissonBloomFilterTest2 {

    public static void main(String[] args) {
        int expectedInsertions = 10;//预期会存放到布隆里的的大小

        RedissonClient redissonClient = RedissonCommonUtil.start();

        RBloomFilter<Integer> rBloomFilter = redissonClient.getBloomFilter("DEMO_FILTER_1");
        System.out.println(rBloomFilter.tryInit(expectedInsertions,0.005));
        for (int i = 0; i < expectedInsertions * 10;i ++) {
            rBloomFilter.add(i);//向布隆过滤器添加
        }

        System.out.println(rBloomFilter.getSize());
        System.out.println(rBloomFilter.getHashIterations());
        System.out.println(rBloomFilter.getExpectedInsertions());

        RedissonCommonUtil.shutdown(redissonClient);
    }

}
