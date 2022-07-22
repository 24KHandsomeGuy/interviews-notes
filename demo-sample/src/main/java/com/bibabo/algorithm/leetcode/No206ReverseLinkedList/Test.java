package com.bibabo.algorithm.leetcode.No206ReverseLinkedList;

import com.bibabo.algorithm.leetcode.No141LinkedListCycle.ListNode;
import com.bibabo.collections.list.linked.ReverseLinkedList;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/20 16:30
 * @Description:
 */
public class Test {

    public static void main(String[] args) {

        ListNode listNode = new ListNode(1);
        ListNode listNode2 = new ListNode(2);
        ListNode listNode3 = new ListNode(3);
        ListNode listNode4 = new ListNode(4);
        ListNode listNode5 = new ListNode(5);
        ListNode listNode6 = new ListNode(6);
        listNode.next = listNode2;
        listNode2.next = listNode3;
        listNode3.next = listNode4;
        listNode4.next = listNode5;
        listNode5.next = listNode6;

        ReverseLinkedList01 reverseLinkedList = new ReverseLinkedList01();
        ListNode resultNode = reverseLinkedList.reverseList(listNode);
        while (resultNode != null) {
            System.out.println(resultNode.val);
            resultNode = resultNode.next;
        }
    }
}
