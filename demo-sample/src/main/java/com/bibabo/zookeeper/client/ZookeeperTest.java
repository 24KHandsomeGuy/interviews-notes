package com.bibabo.zookeeper.client;

import lombok.SneakyThrows;
import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooDefs;
import org.apache.zookeeper.ZooKeeper;

import java.io.IOException;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2021/12/15
 * @time 11:22
 * @description
 */
public class ZookeeperTest {

    private static final String ZookeeperWmsUrlUat = "10.254.128.130:2181";

    private static final String prefix = "/fukuixiang/test";

    static ZooKeeper zooKeeper;

    // 所有节点值都为1
    private static final String value = "1";

    public static void main(String[] args) throws IOException, KeeperException, InterruptedException {
        MyGloableWatcher watcher = new MyGloableWatcher();
        zooKeeper = new ZooKeeper(ZookeeperWmsUrlUat, 5000, new Watcher() {
            @SneakyThrows
            @Override
            public void process(WatchedEvent watchedEvent) {
                String path = watchedEvent.getPath();
                System.out.println("path:" + path + "，事件类型：" + watchedEvent.getType().getIntValue() + "，状态:" + watchedEvent.getState().toString());
                zooKeeper.getChildren(prefix, true);
            }
        });
        List<String> children = zooKeeper.getChildren(prefix, true);
        System.out.println(children);
        zooKeeper.create(prefix + "/hello", value.getBytes(), ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);

        List<String> children2 = zooKeeper.getChildren(prefix, true);
        System.out.println(children2);

        System.in.read();
    }

}
