package com.bibabo.zookeeper.curator;

import org.apache.curator.RetryPolicy;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.cache.ChildData;
import org.apache.curator.framework.recipes.cache.TreeCache;
import org.apache.curator.framework.recipes.cache.TreeCacheEvent;
import org.apache.curator.framework.recipes.cache.TreeCacheListener;
import org.apache.curator.retry.ExponentialBackoffRetry;

/**
 * @author fukuixiang
 * @date 2021/12/15
 * @time 15:52
 * @description
 */
public class CuratorListenerTest3 {

    private static final String ZookeeperWmsUrlUat = "10.254.128.130:2181";

    private static final String prefix = "/fukuixiang/test";

    public static void main(String[] args) throws Exception {

        // 重试策略
        RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 5);
        // 客服端连接
        CuratorFramework client = CuratorFrameworkFactory.builder().connectString(ZookeeperWmsUrlUat).sessionTimeoutMs(20000).retryPolicy(retryPolicy).build();
        client.start();

        // 监听器容器，回调所有监听者
        TreeCache treeCache = new TreeCache(client, prefix);

        // CuratorCacheListener这个版本很老 没有这个类 不然会简单很多
        TreeCacheListener treeCacheListener = new TreeCacheListener() {
            @Override
            public void childEvent(CuratorFramework curatorFramework, TreeCacheEvent treeCacheEvent) {
                ChildData childData = treeCacheEvent.getData();
                switch (treeCacheEvent.getType()) {
                    case NODE_ADDED:
                        System.out.println("节点增加操作，path：" + childData.getPath() + "，data：" + new String(childData.getData()) + "，stat：" + childData.getStat());
                        break;
                    case NODE_UPDATED:
                        System.out.println("节点修改操作，path：" + childData.getPath() + "，data：" + new String(childData.getData()) + "，stat：" + childData.getStat());
                        break;
                    case NODE_REMOVED:
                        System.out.println("节点删除操作，path：" + childData.getPath() + "，data：" + new String(childData.getData()) + "，stat：" + childData.getStat());
                        break;
                    default:
                        break;
                }
            }
        };
        treeCache.getListenable().addListener(treeCacheListener);
        treeCache.start();

        System.in.read();
    }
}
