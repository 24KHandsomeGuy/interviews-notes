package com.bibabo.zookeeper.curator;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.RetryOneTime;

/**
 * @author fukuixiang
 * @date 2022/3/29
 * @time 10:20
 * @description
 */
public class CuratorLockWithCBTest2 {

    public static void main(String[] args) throws Exception {

        CuratorFramework curatorClient = CuratorFrameworkFactory.newClient("10.254.128.130:2181", new RetryOneTime(2000));
        curatorClient.start();

        curatorClient.delete().deletingChildrenIfNeeded().forPath("/chunbo-node-cs/locks/generate-order-return-request");
        curatorClient.close();

    }
}
