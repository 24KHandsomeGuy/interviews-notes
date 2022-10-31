package com.bibabo.algorithm.gupao.chris.linkedlist;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/10/28 14:52
 * @Description:
 */
public class LRUCache {

    public static void main(String[] args) {

        LRUCache lruCache = new LRUCache(2);
        lruCache.put(1, 0);
        lruCache.put(2, 2);
        lruCache.get(1);
        lruCache.put(3, 3);
        lruCache.get(2);
        lruCache.put(4, 4);
        lruCache.get(1);
        lruCache.get(3);
        lruCache.get(4);
    }


    class Node {
        Integer key; // 对应着map中的key
        Integer val;
        Node prev;
        Node next;

        Node(Node prev, Node next, int key, int val) {
            this.prev = prev;
            this.next = next;
            this.key = key;
            this.val = val;
        }
    }

    // The function get and put must each run in O(1) average time complexity.
    // 时间复杂度为O(1)，数据结构借助hash，这里用hashMap
    // 需要借助链表，保持当前LRU容器中，数据的使用情况，最近使用的放在头部，如果超出容量，则从尾部删除
    private int capacity;

    private Map<Integer, Node> map;

    private Node head = new Node(null, null, -1, -1);

    private Node tail = new Node(null, null, -2, -2);

    public LRUCache(int capacity) {
        this.capacity = capacity;
        map = new HashMap<>(capacity);
        head.next = tail;
        tail.prev = head;
    }

    public int get(int key) {
        Node node = map.get(key);
        if (node == null) {
            return -1;
        }
        moveToHead(node);
        return map.get(key).val;
    }

    public void put(int key, int value) {
        Node node = map.get(key);
        if (node == null) {
            node = new Node(null, null, key, value);
        } else {
            node.val = value;
        }
        map.put(key, node);
        moveToHead(node);
        removeTailIfContainerFull();
    }

    private void moveToHead(Node node) {
        // 如果头部节点不是当前key节点，移至链表头部
        if (head.next == node) {
            return;
        }
        Node headNext = head.next;
        head.next = node;
        Node nodeNext = node.next;
        node.next = headNext;
        headNext.prev = node;
        Node nodePrev = node.prev;
        node.prev = head;
        // 旧节点需要处理他的前后节点链接，新节点不需要处理前后节点链接
        if (nodeNext != null && nodePrev != null) {
            nodeNext.prev = nodePrev;
            nodePrev.next = nodeNext;
        }
    }

    private void removeTailIfContainerFull() {
        if (capacity < map.size()) {
            // 删掉tail
            Node tailPrev = tail.prev;
            Node tailPrevPrev = tailPrev.prev;
            tailPrevPrev.next = tail;
            tail.prev = tailPrevPrev;
            tailPrev.prev = null;
            tailPrev.next = null;
            map.remove(tailPrev.key);
        }
    }
}
