package com.bibabo.zookeeper.curator;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.locks.InterProcessMutex;
import org.apache.curator.retry.RetryOneTime;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2022/3/29
 * @time 10:20
 * @description
 */
public class CuratorLockWithCBTest {

    public static void main(String[] args) throws InterruptedException, ExecutionException {

        CuratorFramework curatorClient = CuratorFrameworkFactory.newClient("10.254.128.130:2181", new RetryOneTime(2000));
        curatorClient.start();


        InterProcessMutex lock = new InterProcessMutex(curatorClient, "/chunbo-node-cs/locks/generate-order-return-request/186019418425");
        try {
            lock.acquire();
            System.out.println("获取锁成功");
            TimeUnit.SECONDS.sleep(100);
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
        curatorClient.close();

    }
}
