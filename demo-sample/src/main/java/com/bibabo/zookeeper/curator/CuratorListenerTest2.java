package com.bibabo.zookeeper.curator;

import org.apache.curator.RetryPolicy;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.cache.ChildData;
import org.apache.curator.framework.recipes.cache.PathChildrenCache;
import org.apache.curator.framework.recipes.cache.PathChildrenCacheEvent;
import org.apache.curator.framework.recipes.cache.PathChildrenCacheListener;
import org.apache.curator.retry.ExponentialBackoffRetry;

/**
 * @author fukuixiang
 * @date 2021/12/15
 * @time 15:52
 * @description
 */
public class CuratorListenerTest2 {

    private static final String ZookeeperWmsUrlUat = "10.254.128.130:2181";

    private static final String prefix = "/fukuixiang/test";

    public static void main(String[] args) throws Exception {

        // 重试策略
        // ExponentialBackoffRetry指数倒退衰减重试
        RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 5);
        // 客服端连接
        CuratorFramework client = CuratorFrameworkFactory.builder().connectString(ZookeeperWmsUrlUat).sessionTimeoutMs(20000).retryPolicy(retryPolicy).build();
        client.start();

        // 监听器容器，回调所有监听者
        PathChildrenCache pathChildrenCache = new PathChildrenCache(client, prefix, true);

        // CuratorCacheListener这个版本很老 没有这个类 不然会简单很多
        PathChildrenCacheListener pathChildrenCacheListener = new PathChildrenCacheListener() {
            @Override
            public void childEvent(CuratorFramework curatorFramework, PathChildrenCacheEvent pathChildrenCacheEvent) {
                ChildData childData = pathChildrenCacheEvent.getData();
                switch (pathChildrenCacheEvent.getType()) {
                    case CHILD_ADDED:
                        System.out.println("子节点增加操作，path："+ childData.getPath() + "，data：" + new String(childData.getData()) + "，stat：" + childData.getStat());
                        break;
                    case CHILD_UPDATED:
                        System.out.println("子节点修改操作，path："+ childData.getPath() + "，data：" + new String(childData.getData()) + "，stat：" + childData.getStat());
                        break;
                    case CHILD_REMOVED:
                        System.out.println("子节点删除操作，path："+ childData.getPath() + "，data：" + new String(childData.getData()) + "，stat：" + childData.getStat());
                        break;
                    default:
                        break;
                }
            }
        };
        pathChildrenCache.getListenable().addListener(pathChildrenCacheListener);
        pathChildrenCache.start(PathChildrenCache.StartMode.BUILD_INITIAL_CACHE);

        System.in.read();
    }
}
