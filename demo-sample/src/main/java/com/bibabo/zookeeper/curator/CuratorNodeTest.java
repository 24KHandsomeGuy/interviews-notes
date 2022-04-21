package com.bibabo.zookeeper.curator;

import org.apache.curator.RetryPolicy;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;
import org.apache.zookeeper.CreateMode;

/**
 * @author fukuixiang
 * @date 2021/12/15
 * @time 15:52
 * @description
 */
public class CuratorNodeTest {

    private static final String ZookeeperWmsUrlUat = "10.254.128.130:2181";

    private static final String prefix = "/fukuixiang/test";

    public static void main(String[] args) throws Exception {

        // 重试策略
        RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 5);
        // 客服端连接
        CuratorFramework client = CuratorFrameworkFactory.builder().connectString(ZookeeperWmsUrlUat).sessionTimeoutMs(20000).retryPolicy(retryPolicy).build();
        client.start();
        client.create().withMode(CreateMode.PERSISTENT).forPath(prefix + "3");
        /*for (int i = 0; i < 10; i ++) {
            client.create().withMode(CreateMode.PERSISTENT).forPath(prefix + "/hello" + i);
        }*/


        client.close();
    }
}
