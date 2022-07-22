package com.bibabo.algorithm.leetcode.No141LinkedListCycle;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/20 10:20
 * @Description: 快慢指针
 */
public class LinkedListCycle02 {

    public boolean hasCycle(ListNode head) {
        if (head == null || head.next == null) {
            return false;
        }
        ListNode slow = head;
        ListNode fast = head.next;
        while (slow != fast) {
            // 只需要判断快指针即可
            if (fast == null || fast.next == null) {
                return false;
            }
            slow = slow.next;
            fast = fast.next.next;
        }
        return true;
    }
}
