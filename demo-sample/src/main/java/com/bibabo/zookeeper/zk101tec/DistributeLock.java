package com.bibabo.zookeeper.zk101tec;

import org.I0Itec.zkclient.IZkDataListener;
import org.I0Itec.zkclient.ZkClient;
import org.I0Itec.zkclient.exception.ZkNodeExistsException;
import org.I0Itec.zkclient.serialize.SerializableSerializer;

import java.util.Collections;
import java.util.List;
import java.util.concurrent.CountDownLatch;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/5 10:12
 * @Description
 */
public class DistributeLock {

    private static final String DEFAULT_NODE_VALUE = "fkxTest";

    static ZkClient zkClient;

    static {
        zkClient = new ZkClient("39.107.156.177:2181", 5000, 5000, new SerializableSerializer());
    }

    private final String lockPath;

    private String preNodePath;

    private String currentNodePath;

    List<String> childrenNodeList;

    public DistributeLock(String lockPath) {
        this.lockPath = lockPath;
        try {
            if (!zkClient.exists(lockPath)) {
                zkClient.createPersistent(lockPath);
            }
        } catch (ZkNodeExistsException e) {
            System.out.println("线程：" + Thread.currentThread().getName() + "并发创建节点已存在" + lockPath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void lock() {
        lock(DEFAULT_NODE_VALUE);
    }

    public void lock(String nodeValue) {
        if (tryLock(nodeValue)) {
            return;
        }
        waitForLock();
    }

    private boolean waitForLock() {
        String firstNode = getFirstNode();
        if (currentNodePath.equals(lockPath + "/" + firstNode)) {
            // 当前节点是最小的节点
            System.out.println("线程：" + Thread.currentThread().getName() + "当前节点是最小的节点，获取锁成功：" + currentNodePath);
            return true;
        }
        // 不是最小的节点，寻找前一个节点
        int index = Collections.binarySearch(childrenNodeList, currentNodePath.substring(lockPath.length() + 1));
        preNodePath = childrenNodeList.get(index - 1);
        System.out.println("线程：" + Thread.currentThread().getName() + "当前节点不是最小的节点：" + currentNodePath + "，前一个节点是：" + preNodePath);
        String threadName = Thread.currentThread().getName();
        CountDownLatch countDownLatch = new CountDownLatch(1);
        // 监听上一个节点
        String preNodeFullPath = lockPath + "/" + preNodePath;
        IZkDataListener zkDataListener = new IZkDataListener() {
            @Override
            public void handleDataChange(String dataPath, Object data) throws Exception {
                // ignore
            }

            @Override
            public void handleDataDeleted(String dataPath) throws Exception {
                System.out.println("线程：" + threadName + "，接收到删除节点事件，获取锁成功：" + dataPath);
                countDownLatch.countDown();
            }
        };
        zkClient.subscribeDataChanges(preNodeFullPath, zkDataListener);
        if (zkClient.exists(preNodeFullPath)) {
            try {
                System.out.println("线程：" + threadName + "获取锁失败等待其他线程释放锁唤醒：" + preNodeFullPath);
                countDownLatch.await();
            } catch (InterruptedException e) {
                System.out.println("线程：" + Thread.currentThread().getName() + "等待节点变化异常：" + e.getMessage());
            }
            zkClient.unsubscribeDataChanges(preNodeFullPath, zkDataListener);
        } else {
            System.out.println("线程：" + threadName + "获取锁失败等待其他线程释放锁唤醒：" + preNodeFullPath + "，节点不存在");
        }
        return waitForLock();
    }

    public boolean tryLock(String nodeValue) {
        // 创建临时有序节点
        this.currentNodePath = zkClient.createEphemeralSequential(lockPath + "/", nodeValue);
        return waitForLock();
    }

    private String getFirstNode() {
        // 获取所有子节点
        List<String> childrenNodeList = zkClient.getChildren(lockPath);
        this.childrenNodeList = childrenNodeList;
        // 排序
        Collections.sort(childrenNodeList);
        System.out.println("线程：" + Thread.currentThread().getName() + "临时有序节点：" + currentNodePath + "，childrenNodeList = " + childrenNodeList);
        // 判断当前节点是否是最小的节点
        return childrenNodeList.get(0);
    }

    public void unlock() {
        boolean delResult = zkClient.delete(currentNodePath);
        System.out.println("线程：" + Thread.currentThread().getName() + "释放锁删除节点：" + currentNodePath + "，删除结果：" + delResult);
    }

}