package com.bibabo.zookeeper.client;

import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooKeeper;
import org.apache.zookeeper.data.Stat;

/**
 * @author fukuixiang
 * @date 2021/12/15
 * @time 14:05
 * @description
 */
public class MyGloableWatcher implements Watcher {

    ZooKeeper zooKeeper;

    public void setZooKeeper(ZooKeeper zooKeeper) {
        this.zooKeeper = zooKeeper;
    }

    @Override
    public void process(WatchedEvent watchedEvent) {
        String path = watchedEvent.getPath();
        System.out.println("path:" + path + "，事件类型：" + watchedEvent.getType().getIntValue() + "，状态:" + watchedEvent.getState().toString());
        //System.out.println((watchedEvent.getWrapper().toString()));
        try {
            Stat stat = zooKeeper.exists(path, true);
            byte[] value = zooKeeper.getData(watchedEvent.getPath(), this, stat);
            System.out.println("值：" + new String(value));
        } catch (KeeperException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
