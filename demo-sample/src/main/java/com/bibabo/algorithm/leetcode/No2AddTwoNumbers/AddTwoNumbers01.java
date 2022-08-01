package com.bibabo.algorithm.leetcode.No2AddTwoNumbers;

import com.bibabo.algorithm.leetcode.No141LinkedListCycle.ListNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/27 18:33
 * @Description: 自己写的
 */
public class AddTwoNumbers01 {

    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode answerSentinelNode = new ListNode(-1);
        ListNode currentnode = answerSentinelNode;
        boolean carryFlag = false;
        while (l1 != null || l2 != null) {
            int sumVal;
            if (l1 == null) {
                sumVal = l2.val;
            } else if (l2 == null) {
                sumVal = l1.val;
            } else {
                sumVal = l1.val + l2.val;
            }
            if (carryFlag) {
                sumVal++;
            }
            if (sumVal >= 10) {
                carryFlag = true;
                sumVal = sumVal % 10;
            } else {
                carryFlag = false;
            }
            ListNode newNode = new ListNode(sumVal);
            currentnode.next = newNode;
            currentnode = newNode;
            if (l1 != null) {
                l1 = l1.next;
            }
            if (l2 != null) {
                l2 = l2.next;
            }
        }
        if (carryFlag) {
            currentnode.next = new ListNode(1);
        }
        return answerSentinelNode.next;
    }
}
