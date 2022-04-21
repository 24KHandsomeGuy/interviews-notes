package com.bibabo.thread;

import java.util.concurrent.BlockingDeque;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/1/21
 * @time 10:19
 * @description 并发查询demo
 */
public class ConcurrentQueryDemo {

    public static void main(String[] args) throws InterruptedException {

        int coreThreadSize = 3;// 核心线程数
        int maxThreadSize = 3;// 最大线程数
        int keepAliveTime = 1000;// 最大线程存活时间
        BlockingDeque blockingDeque = new LinkedBlockingDeque();// 阻塞队列，超过核心线程数的任务 放入到阻塞队列等待

        ThreadPoolExecutor executor = new ThreadPoolExecutor(coreThreadSize, maxThreadSize,keepAliveTime , TimeUnit.MILLISECONDS, blockingDeque);

        CountDownLatch countDownLatch = new CountDownLatch(3);// 阻塞器

        for (int i = 0;i < 3; i++) {
            ConcurrentQueryPocessor processor = new ConcurrentQueryPocessor(countDownLatch);
            processor.setName("queryDBThread-" + i);
            executor.execute(processor);
        }
        countDownLatch.await();// 主线程阻塞等待子线程 全部完成
        System.out.println("主线程 执行结束");
        executor.shutdown();
    }

    public static class ConcurrentQueryPocessor extends Thread {

        private CountDownLatch countDownLatch;

        public ConcurrentQueryPocessor(CountDownLatch countDownLatch) {
            this.countDownLatch = countDownLatch;
        }

        @Override
        public void run() {
            // 查询
            System.out.println("线程名称:" + Thread.currentThread().getName() + "正在查询...");

            try {
                Thread.sleep(2000);// 模拟查询2s中
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            countDownLatch.countDown();// 查询结束 需要减掉1 为0时 主线程结束阻塞
        }
    }

}
