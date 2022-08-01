package com.bibabo.algorithm.leetcode.No2AddTwoNumbers;

import com.bibabo.algorithm.leetcode.No141LinkedListCycle.ListNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/27 18:33
 * @Description: 官方题解，更简洁清晰
 */
public class AddTwoNumbers02 {

    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode answerSentinelNode = new ListNode(-1);
        ListNode currentnode = answerSentinelNode;
        int carry = 0;
        while (l1 != null || l2 != null) {
            int i1 = l1 == null ? 0 : l1.val;
            int i2 = l2 == null ? 0 : l2.val;
            int sumVal = i1 + i2 + carry;
            currentnode.next = new ListNode(sumVal % 10);
            currentnode = currentnode.next;
            carry = sumVal / 10;
            if (l1 != null) {
                l1 = l1.next;
            }
            if (l2 != null) {
                l2 = l2.next;
            }
        }
        if (carry > 0) {
            currentnode.next = new ListNode(carry);
        }
        return answerSentinelNode.next;
    }
}
