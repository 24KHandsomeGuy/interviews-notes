package com.bibabo.algorithm.leetcode.No206ReverseLinkedList;

import com.bibabo.algorithm.leetcode.No141LinkedListCycle.ListNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/20 16:19
 * @Description:
 */
public class ReverseLinkedList01 {

    public ListNode reverseList(ListNode head) {
        ListNode prev = null;
        ListNode curr = head;
        ListNode temp;
        while (curr != null) {
            temp = curr.next;
            curr.next = prev;
            prev = curr;
            curr = temp;
        }
        return prev;
    }
}
