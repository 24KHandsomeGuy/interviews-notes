package com.bibabo.zookeeper.zk101tec;

import org.I0Itec.zkclient.ZkClient;
import org.I0Itec.zkclient.serialize.SerializableSerializer;

import java.io.IOException;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/4 20:03
 * @Description
 */
public class Zk101TecTest {

    public static void main(String[] args) throws IOException {
        String zkServers = "39.107.156.177:2181";
        ZkClient zkClient = new ZkClient(zkServers, 5000, 5000, new SerializableSerializer());
        zkClient.deleteRecursive("/zk101tec");
        if (!zkClient.exists("/zk101tec")) {
            zkClient.createPersistent("/zk101tec/second-level", true);
        }
        /*String createNodeRst = zkClient.createEphemeralSequential("/zk101tec/", "fkxTest");
        System.out.println("createNodeRst = " + createNodeRst);*/

        String val = zkClient.readData("/zk101tec");
        System.out.println("val = " + val);
        // System.in.read();
    }
}
