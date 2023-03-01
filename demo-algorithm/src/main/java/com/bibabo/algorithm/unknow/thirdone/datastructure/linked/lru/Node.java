package com.bibabo.algorithm.unknow.thirdone.datastructure.linked.lru;

/**
 * @author fukuixiang
 * @date 2020/9/15
 * @time 18:36
 * @description
 */
public class Node {

    Node prev;
    Node next;
    int value;

    public Node(int value) {
        this.value = value;
    }
}
