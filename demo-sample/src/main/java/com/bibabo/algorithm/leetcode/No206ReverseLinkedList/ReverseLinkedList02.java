package com.bibabo.algorithm.leetcode.No206ReverseLinkedList;

import com.bibabo.algorithm.leetcode.No141LinkedListCycle.ListNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/20 16:19
 * @Description:
 */
public class ReverseLinkedList02 {

    public ListNode reverseList(ListNode head) {
        ListNode result = null;
        for (ListNode x = head; x != null; x = x.next) {
            result = new ListNode(x.val, result);
        }
        return result;
    }
}
