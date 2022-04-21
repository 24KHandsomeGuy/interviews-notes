package com.bibabo.redis.redisson.bloomfilter;

import com.bibabo.redis.redisson.common.RedissonCommonUtil;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RedissonClient;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.RecursiveAction;

/**
 * @author fukuixiang
 * @date 2020/7/16
 * @time 11:39
 * @description 30w数据 总时长：1477460
 */
public class RedissonBloomFilterThread2Test {

    private static final int cpuCnt = Runtime.getRuntime().availableProcessors();//机器的cpu核数

    public static void main(String[] args) {
        int expectedInsertions = 300000;//预期会存放到布隆里的的大小
        RedissonClient redissonClient = RedissonCommonUtil.start();

        RBloomFilter<Integer> rBloomFilter = redissonClient.getBloomFilter("DEMO_FILTER_3");
        System.out.println(rBloomFilter.tryInit(expectedInsertions, 0.00005));

        int eachCnt = expectedInsertions / cpuCnt;
        System.out.println(cpuCnt);
        List<InitBloomFilterFuture> list = new ArrayList<>(cpuCnt);
        int totalLimitStart = 0;
        long startMillis = System.currentTimeMillis();
        for (int i = 0; i < cpuCnt; i++) {
            int start = totalLimitStart;
            int end = start + eachCnt;
            totalLimitStart = end;
            System.out.println("start:" + start + "，end:" + end);
            InitBloomFilterFuture future = new InitBloomFilterFuture(start, end, rBloomFilter);
            future.fork();
            list.add(future);
        }

        for (InitBloomFilterFuture future : list) {
            future.join();
            System.out.println("已完成" + future);
        }

        long endMillis = System.currentTimeMillis();
        System.err.println("总时长：" + (endMillis - startMillis));
        RedissonCommonUtil.shutdown(redissonClient);
    }

    public static class InitBloomFilterFuture extends RecursiveAction {
        int start;
        int end;
        RBloomFilter<Integer> rBloomFilter;

        public InitBloomFilterFuture(int start, int end, RBloomFilter<Integer> rBloomFilter) {
            this.start = start;
            this.end = end;
            this.rBloomFilter = rBloomFilter;
        }

        @Override
        protected void compute() {
            for (int i = start; i < end; i++) {
                rBloomFilter.add(i);//向布隆过滤器添加
            }
        }
    }

}
