package com.bibabo.algorithm.leetcode.No203RemoveLinkedListElements;

import com.bibabo.algorithm.leetcode.No141LinkedListCycle.ListNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/20 14:29
 * @Description: 如果值相等跳过，否则重新new一个Node
 */
public class RemoveLinkedListElements01 {

    public ListNode removeElements(ListNode head, int val) {
        ListNode newHead = new ListNode(-1);
        ListNode currNode = newHead;
        while (head != null) {
            if (head.val != val) {
                currNode.next = new ListNode(head.val);
                currNode = currNode.next;
            }

            head = head.next;
        }
        return newHead.next;
    }
}
