package com.bibabo.zookeeper.zk101tec;

import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/5 11:03
 * @Description
 */
public class DistributeLockTest {

    public static void main(String[] args) {
        for (int i = 0; i < 3; i++) {
            new Thread(() -> {
                DistributeLock lock = new DistributeLock("/lockTest");
                lock.lock();
                Random random = new Random();
                int businessHandleTime = random.nextInt(10);
                System.out.println("线程：" + Thread.currentThread().getName() + "业务处理时间：" + businessHandleTime);
                try {
                    TimeUnit.SECONDS.sleep(businessHandleTime);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                lock.unlock();
            }).start();
        }
    }
}
