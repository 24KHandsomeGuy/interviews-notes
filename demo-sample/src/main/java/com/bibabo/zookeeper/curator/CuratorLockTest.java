package com.bibabo.zookeeper.curator;

import com.bibabo.thread.threadPool.threadfactory.CustomizableThreadFactory;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.locks.InterProcessMutex;
import org.apache.curator.retry.RetryOneTime;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2022/3/29
 * @time 10:20
 * @description
 */
public class CuratorLockTest {

    private static final int CPU_CORE_NUMS = Runtime.getRuntime().availableProcessors();

    private static final int threadNums = 100;

    public static void main(String[] args) throws InterruptedException {

        CuratorFramework curatorClient = CuratorFrameworkFactory.newClient("10.254.128.130:2181", new RetryOneTime(2000));
        curatorClient.start();
        // LinkedBlockingQueue<Runnable> queue = new LinkedBlockingQueue<>();
        ArrayBlockingQueue<Runnable> queue = new ArrayBlockingQueue<>(20);
        // ThreadPoolExecutor executor = new ThreadPoolExecutor(CPU_CORE_NUMS + 1, CPU_CORE_NUMS + 1, 30, TimeUnit.SECONDS, queue, new CustomizableThreadFactory(), new NewThreadExecutePolicy());
        // ThreadPoolExecutor executor = new ThreadPoolExecutor(CPU_CORE_NUMS + 1, CPU_CORE_NUMS + 1, 30, TimeUnit.SECONDS, queue, new CustomizableThreadFactory(), new ThreadPoolExecutor.AbortPolicy());
        ThreadPoolExecutor executor = new ThreadPoolExecutor(50, 100, 30, TimeUnit.SECONDS, queue, new CustomizableThreadFactory(), new ThreadPoolExecutor.AbortPolicy());

        for (int i = 0; i < threadNums; i ++) {
            final int j = i;
            executor.execute(() -> {
                // 独占可重入锁
                InterProcessMutex lock = new InterProcessMutex(curatorClient, "/chunbo-node-cs/locks/generate-order-return-request");
                try {
                    lock.acquire();
                    System.out.println("THREAD:" + Thread.currentThread().getName() + " has acquired distributed lock，will process bussiness：" + j);
                    TimeUnit.SECONDS.sleep(1);
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        lock.release();
                    } catch (Exception e) {
                        System.out.println("THREAD:" + Thread.currentThread().getName() + "has released distributed lock exception" + e.getMessage());
                    }
                    System.out.println("THREAD:" + Thread.currentThread().getName() + "has released distributed lock");
                }
            });
        }

        TimeUnit.SECONDS.sleep(70);
        curatorClient.close();
        executor.shutdown();
    }
}
