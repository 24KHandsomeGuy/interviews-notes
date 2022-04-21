package com.bibabo.redis.redisson.bloomfilter;

import org.redisson.api.RBloomFilter;
import org.redisson.api.RedissonClient;
import redis.redisson.common.RedissonCommonUtil;

/**
 * @author fukuixiang
 * @date 2020/7/16
 * @time 11:39
 * @description
 */
public class RedissonBloomFilterTest {

    public static void main(String[] args) {
        int expectedInsertions = 1000;//预期会存放到布隆里的的大小

        RedissonClient redissonClient = RedissonCommonUtil.start();

        RBloomFilter<Integer> rBloomFilter = redissonClient.getBloomFilter("DEMO_FILTER_1");
        System.out.println(rBloomFilter.tryInit(expectedInsertions,0.00005));
        for (int i = 0; i < expectedInsertions;i ++) {
            rBloomFilter.add(i);//向布隆过滤器添加
        }

        System.out.println(rBloomFilter.getSize());
        System.out.println(rBloomFilter.getHashIterations());
        System.out.println(rBloomFilter.getExpectedInsertions());
        // 经过测试这种情况不存在
        for (int i = 0; i < expectedInsertions;i ++) {
            if (!rBloomFilter.contains(i)) {//检验已存在的元素是否判断成功
                System.err.println("本应存在 但是不存在" + i);
            }
        }

        int cnt = 0;
        for (int i = expectedInsertions; i < expectedInsertions * 2;i ++) {
            if (rBloomFilter.contains(i)) {
                System.err.println("本应不存在 但是存在" + i);
                cnt ++;
            }
        }

        System.out.println(cnt);

        RedissonCommonUtil.shutdown(redissonClient);
    }

}
