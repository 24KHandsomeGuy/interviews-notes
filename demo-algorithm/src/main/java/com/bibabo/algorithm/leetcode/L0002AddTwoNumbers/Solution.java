package com.bibabo.algorithm.leetcode.L0002AddTwoNumbers;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/1 10:52
 * @Description:
 */
public class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        if (l1 == null || l2 == null) return null;

        ListNode dummyNode = new ListNode();
        ListNode prevNode = dummyNode;
        boolean carryFlag = false;
        while (l1 != null || l2 != null) {
            int val;
            if (l1 == null) {
                val = l2.val;
            } else if (l2 == null) {
                val = l1.val;
            } else {
                val = l1.val + l2.val;
            }
            if (carryFlag) {
                val = val + 1;
                carryFlag = false;
            }
            if (val / 10 > 0) {
                val = val % 10;
                carryFlag = true;
            }
            ListNode currNode = new ListNode(val);
            prevNode.next = currNode;
            prevNode = currNode;
            if (l1 != null) {
                l1 = l1.next;
            }
            if (l2 != null) {
                l2 = l2.next;
            }
        }
        if (carryFlag) {
            prevNode.next = new ListNode(1);
        }
        return dummyNode.next;
    }

    public class ListNode {
        int val;
        ListNode next;

        ListNode() {
        }

        ListNode(int val) {
            this.val = val;
        }

        ListNode(int val, ListNode next) {
            this.val = val;
            this.next = next;
        }
    }
}
