package com.bibabo.zookeeper.curator;

import com.bibabo.thread.threadPool.threadfactory.CustomizableThreadFactory;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.locks.InterProcessMutex;
import org.apache.curator.retry.RetryOneTime;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author fukuixiang
 * @date 2022/3/29
 * @time 10:20
 * @description
 */
public class CuratorLockTest2 {

    public static void main(String[] args) throws InterruptedException, ExecutionException {

        CuratorFramework curatorClient = CuratorFrameworkFactory.newClient("10.254.128.130:2181", new RetryOneTime(2000));
        curatorClient.start();


        AtomicInteger seq = new AtomicInteger(1);
        ScheduledExecutorService executorService = new ScheduledThreadPoolExecutor(5, new CustomizableThreadFactory());

        ScheduledFuture<String> future = null;
        ScheduledFuture<String> future2 = null;

        executorService.schedule(
                () -> {
                    InterProcessMutex lock = new InterProcessMutex(curatorClient, "/chunbo-node-cs/locks/generate-order-return-request/186019418425");
                    try {
                        lock.acquire();
                        System.out.println("获取锁成功");
                        TimeUnit.SECONDS.sleep(10);
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
                }, 1, TimeUnit.SECONDS
        );

        future = executorService.schedule(
                () -> {
                    try {
                        curatorClient.delete().forPath("/chunbo-node-cs/locks/generate-order-return-request/186019418425");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    System.out.println(Thread.currentThread().getName() + "删除节点");
                    return Thread.currentThread().getName() + "SUCCESS";
                }, 3, TimeUnit.SECONDS
        );

        future2 = executorService.schedule(
                () -> {
                    try {
                        curatorClient.delete().forPath("/chunbo-node-cs/locks/generate-order-return-request/186019418425");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    System.out.println(Thread.currentThread().getName() + "删除节点");
                    return Thread.currentThread().getName() + "SUCCESS";
                }, 5, TimeUnit.SECONDS
        );

        System.out.println(future.get());
        System.out.println(future2.get());
        curatorClient.close();
        executorService.shutdown();
    }
}
