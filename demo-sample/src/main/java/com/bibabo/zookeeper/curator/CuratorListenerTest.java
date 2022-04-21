package com.bibabo.zookeeper.curator;

import org.apache.curator.RetryPolicy;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.cache.ChildData;
import org.apache.curator.framework.recipes.cache.NodeCache;
import org.apache.curator.framework.recipes.cache.NodeCacheListener;
import org.apache.curator.retry.ExponentialBackoffRetry;

/**
 * @author fukuixiang
 * @date 2021/12/15
 * @time 15:52
 * @description
 */
public class CuratorListenerTest {

    private static final String ZookeeperWmsUrlUat = "10.254.128.130:2181";

    private static final String prefix = "/fukuixiang/test";

    public static void main(String[] args) throws Exception {

        // 重试策略
        RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 5);
        // 客服端连接
        CuratorFramework client = CuratorFrameworkFactory.builder().connectString(ZookeeperWmsUrlUat).sessionTimeoutMs(20000).retryPolicy(retryPolicy).build();
        client.start();

        // 监听器容器，回调所有监听者
        NodeCache nodeCache = new NodeCache(client, prefix, false);

        // CuratorCacheListener这个版本很老 没有这个类 不然会简单很多
        NodeCacheListener nodeCacheListener = new NodeCacheListener() {
            @Override
            public void nodeChanged() throws Exception {
                ChildData childData = nodeCache.getCurrentData();
                System.out.println("节点变化path："+ childData.getPath() + "，data：" + new String(childData.getData()) + "，stat：" + childData.getStat());
            }
        };
        nodeCache.getListenable().addListener(nodeCacheListener);
        nodeCache.start();

        System.in.read();
    }
}
