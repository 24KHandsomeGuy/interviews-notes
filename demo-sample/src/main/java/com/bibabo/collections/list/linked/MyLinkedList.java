package com.bibabo.collections.list.linked;

/**
 * @author fukuixiang
 * @date 2021/3/8
 * @time 19:30
 * @description 4种操作 增删改查 其中增加操作要多一些，头结点新增，尾结点新增，指定下标位置前新增，指定下标位置后新增
 */
public class MyLinkedList<E> {

    Node<E> sentinelHead;// 哨兵头结点
    Node<E> sentinelTail;// 哨兵尾结点

    int length;

    public MyLinkedList() {
        this.sentinelHead = new Node<>(null, null, null);
        this.sentinelTail = new Node<>(null, null, null);
        sentinelHead.next = sentinelTail;
        sentinelTail.prev = sentinelHead;
    }

    public E delete(int index) {
        if (index >= length) {
            return null;
        }
        Node<E> deleteNode = sentinelHead;
        for (int i = 0; i <= index; i ++) {
            deleteNode = deleteNode.next;
        }
        E oldValue = deleteNode.element;
        deleteNode.element = null;

        deleteNode.prev.next = deleteNode.next;
        deleteNode.next.prev = deleteNode.prev;

        length --;
        return oldValue;
    }

    public E getFirst() {
        return (E) sentinelHead.next.element;
    }

    public E getLast() {
        return (E) sentinelTail.prev.element;
    }

    public boolean addAfter(E e, int index) {
        if (index >= length) {
            return false;
        }
        Node<E> indexNode = sentinelHead;
        for (int i = 0; i <= index; i ++) {
            indexNode = indexNode.next;
        }
        Node<E> newNode = new Node<>(indexNode, indexNode.next, e);
        indexNode.next.prev = newNode;
        indexNode.next = newNode;

        length ++;
        return true;
    }

    public boolean addbefore(E e, int index) {
        if (index >= length) {
            return false;
        }
        Node<E> indexNode = sentinelHead;
        for (int i = 0; i <= index; i ++) {
            indexNode = indexNode.next;
        }
        Node<E> newNode = new Node<>(indexNode.prev, indexNode, e);
        indexNode.prev.next = newNode;
        indexNode.prev = newNode;

        length ++;
        return true;
    }

    public boolean addToTail(E e) {
        Node<E> newNode = new Node<>(sentinelTail.prev, sentinelTail, e);
        sentinelTail.prev.next = newNode;
        sentinelTail.prev = newNode;

        length ++;
        return true;
    }

    public boolean addToHead(E e) {
        Node<E> newNode = new Node<>(sentinelHead, sentinelHead.next, e);
        sentinelHead.next.prev = newNode;
        sentinelHead.next = newNode;

        length ++;
        return true;
    }

    public Node<E> getFirstNode() {
        return sentinelHead.next;
    }

    public Node<E> getLastNode() {
        return sentinelTail.prev;
    }

    public Node<E> node(int index) {
        if (index == length - 1) {
            return sentinelTail.prev;
        }
        if (index < (length >> 1)) {
            Node<E> node = sentinelHead;
            for (int i = 0; i <= index; i ++) {
                node = node.next;
            }
            return node;
        } else {
            Node<E> node = sentinelTail;
            for (int i = length; i > index; i --) {
                node = node.prev;
            }
            return node;
        }
    }

    public class Node<E> {
        Node prev;
        Node next;
        E element;

        public Node(Node prev, Node next, E element) {
            this.prev = prev;
            this.next = next;
            this.element = element;
        }
    }

}
