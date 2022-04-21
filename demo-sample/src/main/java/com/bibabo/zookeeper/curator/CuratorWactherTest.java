package com.bibabo.zookeeper.curator;

import lombok.SneakyThrows;
import org.apache.curator.RetryPolicy;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.data.Stat;

import java.util.List;

/**
 * @author fukuixiang
 * @date 2021/12/15
 * @time 15:52
 * @description
 */
public class CuratorWactherTest {

    private static final String ZookeeperWmsUrlUat = "10.254.128.130:2181";

    private static final String prefix = "/fukuixiang/test";

    public static void main(String[] args) throws Exception {

        // 重试策略
        RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 5);
        // 客服端连接
        CuratorFramework client = CuratorFrameworkFactory.builder().connectString(ZookeeperWmsUrlUat).sessionTimeoutMs(20000).retryPolicy(retryPolicy).build();
        client.start();
        Watcher watcher = new Watcher() {
            @SneakyThrows
            @Override
            public void process(WatchedEvent watchedEvent) {
                String path = watchedEvent.getPath();
                System.out.println("path:" + path + "，事件类型：" + watchedEvent.getType().getIntValue() + "，状态:" + watchedEvent.getState().toString());
                List<String> data = client.getChildren().usingWatcher(this).forPath(prefix);
                System.out.println(data);
                // data增量同步到bloom中
            }
        };
        Stat stat = client.checkExists().forPath(prefix);
        if (stat == null) {
            String r = client.create().forPath(prefix);
            System.out.println(r);
        }
        client.getChildren().usingWatcher(watcher).forPath(prefix);


        System.in.read();
    }
}
