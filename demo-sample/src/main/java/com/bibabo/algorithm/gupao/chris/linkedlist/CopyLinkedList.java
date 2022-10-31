package com.bibabo.algorithm.gupao.chris.linkedlist;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/10/26 16:26
 * @Description:
 */
public class CopyLinkedList {

    public static void main(String[] args) {
        Node node5 = new Node(5);
        Node node4 = new Node(4);
        node4.next = node5;
        Node node3 = new Node(3);
        node3.next = node4;
        Node node2 = new Node(2);
        node2.next = node3;
        Node node1 = new Node(1);
        node1.next = node2;

        Node newHead = copyRandomList2(node1);
        while (newHead != null) {
            System.out.println(newHead.val);
            newHead = newHead.next;
        }
    }

    /**
     * 时间复杂度O(n)，空间复杂度O(1)
     * 相较于map映射，节省了空间复杂度
     *
     * @param head
     * @return
     */
    public static Node copyRandomList(Node head) {
        if (head == null) return null;
        // 反转链表
        Node prev = head;
        Node curr = head.next;
        prev.next = null;
        while (curr != null) {
            Node next = curr.next;
            curr.next = prev;
            prev = curr;
            curr = next;
        }
        // 此时prev是反转后的头节点，向下遍历
        Node newPrev = null;
        while (prev != null) {
            Node newNode = new Node(prev.val);
            newNode.next = newPrev;
            newPrev = newNode;
            prev = prev.next;
        }
        return newPrev;
    }

    public static Node copyRandomList2(Node head) {
        if (head == null) return null;
        Node dummy = new Node(-1);
        Node prev = dummy;
        while (head != null) {
            Node newNode = new Node(head.val);
            prev.next = newNode;
            prev = newNode;
            head = head.next;
        }
        return dummy.next;
    }

    static class Node {
        int val;
        Node next;

        private Node(int val) {
            this.val = val;
            this.next = null;
        }
    }
}
