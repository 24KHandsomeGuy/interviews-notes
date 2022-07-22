package com.bibabo.algorithm.leetcode.No203RemoveLinkedListElements;

import com.bibabo.algorithm.leetcode.No141LinkedListCycle.ListNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/20 14:29
 * @Description: 修改了原节点
 */
public class RemoveLinkedListElements02 {

    public ListNode removeElements(ListNode head, int val) {

        ListNode dummyNode = new ListNode(-1);
        dummyNode.next = head;
        ListNode currNode = dummyNode;
        while (currNode.next != null) {
            if (currNode.next.val == val) {
                currNode.next = currNode.next.next;
            } else {
                currNode = currNode.next;
            }
        }
        return dummyNode.next;
    }
}
