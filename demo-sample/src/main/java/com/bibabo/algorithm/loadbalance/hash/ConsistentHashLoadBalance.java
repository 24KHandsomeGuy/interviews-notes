package com.bibabo.algorithm.loadbalance.hash;

import com.bibabo.algorithm.loadbalance.LoadBalance;

import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/11 18:41
 * @Description:
 */
public class ConsistentHashLoadBalance implements LoadBalance<String, String> {

    // 每个真实节点的虚拟节点数量
    private static final int VIRTUAL_NODES = 160;

    private final TreeMap<Integer, String> hashRing = new TreeMap<>();

    private final List<String> serverIpList;

    public ConsistentHashLoadBalance(List<String> serverIpList) {
        this.serverIpList = serverIpList;
        for (String serverIP : this.serverIpList) {
            this.hashRing.put(getHashCode(serverIP), serverIP);
            // 根据设定的虚拟节点数量进行虚拟节点映射
            for (int i = 0; i < VIRTUAL_NODES; i++) {
                // 计算出一个虚拟节点的哈希值（只要不同即可）
                int hash = getHashCode(serverIP + i);
                // 将虚拟节点添加到哈希环结构上
                this.hashRing.put(hash, serverIP);
            }
        }
    }

    // 哈希方法：用于计算一个IP的哈希值
    public int getHashCode(String IP) {
        final int p = 1904390101;
        int hash = (int) 1901102097L;
        for (int i = 0; i < IP.length(); i++)
            hash = (hash ^ IP.charAt(i)) * p;
        hash += hash << 13;
        hash ^= hash >> 7;
        hash += hash << 3;
        hash ^= hash >> 17;
        hash += hash << 5;

        // 如果算出来的值为负数则取其绝对值
        if (hash < 0)
            hash = Math.abs(hash);
        return hash;
    }


    @Override
    public String select(String ip) {
        int clientIpHashCode = getHashCode(ip);
        SortedMap<Integer, String> sortedMap = hashRing.tailMap(clientIpHashCode);
        // 得到该树的第一个元素，也就是最小的元素
        Integer treeNodeKey;
        // 如果没有大于该元素的子树了，则取整棵树的第一个元素，相当于取哈希环中的最小元素
        if (sortedMap == null)
            treeNodeKey = hashRing.firstKey();
        else
            treeNodeKey = sortedMap.firstKey();
        return hashRing.get(treeNodeKey);
    }
}
