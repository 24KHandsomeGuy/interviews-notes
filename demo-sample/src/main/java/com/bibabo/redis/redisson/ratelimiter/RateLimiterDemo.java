package com.bibabo.redis.redisson.ratelimiter;

import com.bibabo.redis.redisson.common.RedissonCommonUtil;
import org.redisson.api.RRateLimiter;
import org.redisson.api.RateIntervalUnit;
import org.redisson.api.RateType;
import org.redisson.api.RedissonClient;

import java.io.IOException;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/24 13:58
 * @Description:
 */
public class RateLimiterDemo {

    public static void main(String[] args) throws IOException, InterruptedException {
        RedissonClient redissonClient = RedissonCommonUtil.aliyunStart();
        RRateLimiter rateLimiter = redissonClient.getRateLimiter("RateLimter-TEST-01");
        // 初始化
        // 最大流速 = 每30秒钟产生10个令牌
        boolean trySetResult = rateLimiter.trySetRate(RateType.OVERALL, 10, 30, RateIntervalUnit.SECONDS);
        System.out.println("trySetResult:" + trySetResult);
        new Thread(() -> {
            int localToken = 9;
            System.out.println(Thread.currentThread().getName() + "尝试到远程令牌，即将执行，数量" + localToken);
            // 获取5个令牌到本地
            rateLimiter.acquire(localToken);
            System.out.println(Thread.currentThread().getName() + "获取到远程令牌，即将执行，数量" + localToken);
            CountDownLatch countDownLatch = new CountDownLatch(localToken);
            for (int i = 0; i < localToken; i++) {
                new Thread(() -> {
                    try {
                        System.out.println(Thread.currentThread().getName() + "获取到本地令牌，即将执行");
                        Thread.sleep(10 * 1000);
                        countDownLatch.countDown();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }, "Thread-01-" + i).start();
            }
            try {
                countDownLatch.await();
                System.out.println(Thread.currentThread().getName() + "执行完毕");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }, "Thread-01").start();

        new Thread(() -> {
            int localToken = 5;
            System.out.println(Thread.currentThread().getName() + "尝试到远程令牌，即将执行，数量" + localToken);
            // 获取5个令牌到本地
            rateLimiter.acquire(localToken);
            System.out.println(Thread.currentThread().getName() + "获取到远程令牌，即将执行，数量" + localToken);
            CountDownLatch countDownLatch = new CountDownLatch(localToken);
            for (int i = 0; i < localToken; i++) {
                new Thread(() -> {
                    try {
                        System.out.println(Thread.currentThread().getName() + "获取到本地令牌，即将执行");
                        Thread.sleep(10 * 1000);
                        countDownLatch.countDown();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }, "Thread-02-" + i).start();
            }
            try {
                countDownLatch.await();
                System.out.println(Thread.currentThread().getName() + "执行完毕");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }, "Thread-02").start();

        new Thread(() -> {
            int localToken = 1;
            System.out.println(Thread.currentThread().getName() + "尝试到远程令牌，即将执行，数量" + localToken);
            // 获取5个令牌到本地
            rateLimiter.acquire(localToken);
            System.out.println(Thread.currentThread().getName() + "获取到远程令牌，即将执行，数量" + localToken);
            CountDownLatch countDownLatch = new CountDownLatch(localToken);
            for (int i = 0; i < localToken; i++) {
                new Thread(() -> {
                    try {
                        System.out.println(Thread.currentThread().getName() + "获取到本地令牌，即将执行");
                        Thread.sleep(10 * 1000);
                        countDownLatch.countDown();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }, "Thread-03-" + i).start();
            }
            try {
                countDownLatch.await();
                System.out.println(Thread.currentThread().getName() + "执行完毕");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }, "Thread-03").start();

        TimeUnit.MINUTES.sleep(2);
        System.out.println("全部结束");
        RedissonCommonUtil.shutdown(redissonClient);
    }
}
