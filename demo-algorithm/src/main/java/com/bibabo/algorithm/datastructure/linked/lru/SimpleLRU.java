package com.bibabo.algorithm.datastructure.linked.lru;

import java.util.HashMap;
import java.util.Map;

/**
 * @author fukuixiang
 * @date 2020/9/15
 * @time 18:36
 * @description LRU algorithm
 */
public class SimpleLRU {

    Node dummyHead = new Node(-1);
    Node dummyTail = new Node(-1);

    private int capcaity;

    Map<Integer,Node> cacheMap = new HashMap<Integer, Node>();

    public SimpleLRU(int capcaity) {
        this.capcaity = capcaity;
        dummyHead.next = dummyTail;
        dummyTail.prev = dummyHead;
    }

    public int put(int key,int value) {
        //update
        if (cacheMap.containsKey(key)) {
            Node node = get(key);//also move
            // Node node = cacheMap.get(key);//dont move
            node.value = value;
            return key;
        }
        //make up the node
        Node node = new Node(value);
        Node dummyTailPrev = dummyTail.prev;
        dummyTailPrev.next = node;
        dummyTail.prev = node;
        node.next = dummyTail;
        node.prev = dummyTailPrev;
        cacheMap.put(key,node);
        moveToHead(node);
        if (cacheMap.size() > capcaity) {
            removeTail();
        }

        return key;
    }

    private void removeTail() {
        Node oldPrev = dummyTail.prev.prev;
        oldPrev.next = dummyTail;
        dummyTail.prev = oldPrev;
    }

    public Node get(int key) {
        if (!cacheMap.containsKey(key)) {
            return null;
        }
        Node node = cacheMap.get(key);
        //move to head
        moveToHead(node);
        return node;
    }

    private void moveToHead(Node node) {
        //if container only own one element ,it does not need to move

        //update node old front after
        Node nodeOldNext = node.next;
        Node nodeOldPrev = node.prev;
        nodeOldPrev.next = nodeOldNext;
        nodeOldNext.prev = nodeOldPrev;
        //move node
        Node oldNext = dummyHead.next;
        dummyHead.next = node;
        node.next = oldNext;
        node.prev = dummyHead;
        oldNext.prev = node;
    }

}
