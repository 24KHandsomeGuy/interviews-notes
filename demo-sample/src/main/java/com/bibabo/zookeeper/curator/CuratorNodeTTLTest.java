package com.bibabo.zookeeper.curator;

import org.apache.curator.RetryPolicy;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;

/**
 * @author fukuixiang
 * @date 2021/12/15
 * @time 15:52
 * @description 3.6.3  3.5.8以上支持ttl  zoo.cfg 加上extendedTypesEnabled=true
 */
public class CuratorNodeTTLTest {

    private static final String ZookeeperWmsUrlUat = "127.0.0.1:2181";

    private static final String prefix = "/fukuixiang/test";

    public static void main(String[] args) throws Exception {

        // 重试策略
        RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 5);
        // 客服端连接
        CuratorFramework client = CuratorFrameworkFactory.builder().connectString(ZookeeperWmsUrlUat).sessionTimeoutMs(20000).retryPolicy(retryPolicy).build();
        client.start();

        //client.create().withTtl(10).withMode(CreateMode.PERSISTENT_WITH_TTL).forPath(prefix + "/hello");


        client.close();
    }
}
