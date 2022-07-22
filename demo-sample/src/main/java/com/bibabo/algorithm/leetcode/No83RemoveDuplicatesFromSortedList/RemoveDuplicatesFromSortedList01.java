package com.bibabo.algorithm.leetcode.No83RemoveDuplicatesFromSortedList;

import com.bibabo.algorithm.leetcode.No141LinkedListCycle.ListNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/20 17:54
 * @Description:
 */
public class RemoveDuplicatesFromSortedList01 {

    public ListNode deleteDuplicates(ListNode head) {

        ListNode headNode = head;
        while (head != null && head.next != null) {
            if (head.val == head.next.val) {
                ListNode tmp = head.next;
                head.next = head.next.next;
                tmp.next = null;
            } else {
                head = head.next;
            }
        }
        return headNode;
    }
}
