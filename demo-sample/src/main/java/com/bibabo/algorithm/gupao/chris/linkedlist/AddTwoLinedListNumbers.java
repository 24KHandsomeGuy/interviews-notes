package com.bibabo.algorithm.gupao.chris.linkedlist;

import com.bibabo.algorithm.leetcode.No141LinkedListCycle.ListNode;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/10/28 10:55
 * @Description:
 */
public class AddTwoLinedListNumbers {

    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        if (l1 == null) return l2;
        if (l2 == null) return l1;
        int carry = 0;
        ListNode head = new ListNode(-1);
        ListNode prev = head;
        while (l1 != null || l2 != null) {
            int l1Val = l1 == null ? 0 : l1.val;
            int l2Val = l2 == null ? 0 : l2.val;
            int result = l1Val + l2Val + carry;
            carry = result / 10;
            result = result % 10;
            ListNode newNode = new ListNode(result);
            // 组装链条
            prev.next = newNode;
            prev = newNode;
            l1 = l1 == null ? null : l1.next;
            l2 = l2 == null ? null : l2.next;
        }
        if (carry > 0) {
            prev.next = new ListNode(1);
        }
        return head.next;
    }

    /**
     * 和上面的解法是一样的
     * 注意：dummy节点的好处就是，可以为你节省
     *              if (head == null) {
     *                 head = newNode;
     *             } else {
     *                 prev.next = newNode;
     *             }
     * 像这样子的判断
     * @param l1
     * @param l2
     * @return
     */
    public ListNode addTwoNumbers2(ListNode l1, ListNode l2) {
        if (l1 == null) return l2;
        if (l2 == null) return l1;
        int carry = 0;
        ListNode head = null;
        ListNode prev = null;
        while (l1 != null || l2 != null) {
            int l1Val = l1 == null ? 0 : l1.val;
            int l2Val = l2 == null ? 0 : l2.val;
            int result = l1Val + l2Val + carry;
            carry = result / 10;
            result = result % 10;
            ListNode newNode = new ListNode(result);
            // 组装链条
            if (head == null) {
                head = newNode;
            } else {
                prev.next = newNode;
            }
            prev = newNode;
            l1 = l1 == null ? null : l1.next;
            l2 = l2 == null ? null : l2.next;
        }
        if (carry > 0) {
            prev.next = new ListNode(carry);
        }
        return head;
    }
}
