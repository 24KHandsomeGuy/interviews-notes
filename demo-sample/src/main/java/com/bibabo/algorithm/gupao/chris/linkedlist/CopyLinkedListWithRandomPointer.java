package com.bibabo.algorithm.gupao.chris.linkedlist;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/10/26 16:26
 * @Description:
 */
public class CopyLinkedListWithRandomPointer {

    public static void main(String[] args) {
        // 构建单向链表，一定是从后向前构建的！
        Node node5 = new Node(5);
        Node node4 = new Node(4);
        node4.next = node5;
        Node node3 = new Node(3);
        node3.next = node4;
        Node node2 = new Node(2);
        node2.next = node3;
        Node node1 = new Node(1);
        node1.next = node2;

        Node newHead = copyRandomList(node1);
        while (newHead != null) {
            System.out.println(newHead.val);
            newHead = newHead.next;
        }
    }

    /**
     * 借助map进行映射复制
     * 时间复杂度O(n)，空间复杂度O(n)
     *
     * @param head
     * @return
     */
    static Node copyRandomList(Node head) {
        // 构建新链表，填充新链表中的next指向和random指向
        // 目前接触到的复制，都可以使用map容器还协助解决
        if (head == null) return head;
        // 1.复制构建新链表，并保存旧链表节点与新链表节点中值相等的hash映射关系
        Map<Node, Node> map = new HashMap<>();
        Node curr = head;
        while (curr != null) {
            Node newNode = new Node(curr.val);
            map.put(curr, newNode);
            curr = curr.next;
        }
        curr = head;
        // 2.再次从头遍历旧链表，通过借助map找到其next和random所映射的节点
        while (curr != null) {
            Node newNode = map.get(curr);
            newNode.next = map.get(curr.next);
            newNode.random = curr.random == null ? null : map.get(curr.random);
            curr = curr.next;
        }
        return map.get(head);
    }

    /**
     * 使用next旧新节点首尾相连 1 -> 1` -> 2 -> 2` -> 3 -> 3`
     * 时间复杂度O(n)，空间复杂度O(1)
     *
     * @param head
     * @return
     */
    static Node copyRandomList2(Node head) {
        // 上一种解法之所以借助map，是为了保存旧新节点的映射关系，这样可以找到next和random，空间复杂度O(n)
        // 此种解法不需要额外的存储空间来保存旧新节点的关系，旧新节点的关系通过next来找到
        // 如：1 -> 1` -> 2 -> 2` -> 3 -> 3` -> 4 -> 4`
        // 先组装上面的链条，这样新的random就等于旧的random.next。最后再切断还原链条即可
        if (head == null) return head;
        // 1.组装旧 + 新链条
        Node curr = head;
        while (curr != null) {
            Node newNode = new Node(curr.val);
            newNode.next = curr.next;
            curr.next = newNode;
            curr = newNode.next;
        }
        curr = head;
        // 2.填充新节点的random
        while (curr != null) {
            curr.next.random = curr.random == null ? null : curr.random.next;
            curr = curr.next.next;
        }
        curr = head;
        Node newHead = curr.next;
        // 3.还原旧链条，拼接新链条，这样next的填充也就解决了
        while (curr != null) {
            Node oldNext = curr.next.next; // 2
            curr.next.next = oldNext == null ? null : oldNext.next; // 1` -> 2`
            curr.next = oldNext; // 1 -> 2
            curr = curr.next; // 2
        }
        return newHead;
    }

    static class Node {
        int val;
        Node next;
        Node random;

        private Node(int val) {
            this.val = val;
            this.next = null;
            this.random = null;
        }
    }
}
