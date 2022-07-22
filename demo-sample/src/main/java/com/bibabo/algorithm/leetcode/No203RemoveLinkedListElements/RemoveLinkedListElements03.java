package com.bibabo.algorithm.leetcode.No203RemoveLinkedListElements;

import com.bibabo.algorithm.leetcode.No141LinkedListCycle.ListNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/20 14:29
 * @Description: 递归
 */
public class RemoveLinkedListElements03 {

    public ListNode removeElements(ListNode head, int val) {
        if (head == null) {
            return head;
        }
        head.next = removeElements(head.next, val);
        return head.val == val ? head.next : head;
    }
}
