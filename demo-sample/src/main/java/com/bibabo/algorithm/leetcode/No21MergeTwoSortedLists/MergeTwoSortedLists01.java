package com.bibabo.algorithm.leetcode.No21MergeTwoSortedLists;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/20 11:37
 * @Description: 向后遍历组装链表，需要一个哨兵头节点
 */
public class MergeTwoSortedLists01 {

    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {

        ListNode headNode = new ListNode(-1);
        ListNode currNode = headNode;
        while (list1 != null || list2 != null) {
            if (list1 == null) {
                currNode.next = list2;
                list2 = list2.next;
            } else if (list2 == null) {
                currNode.next = list1;
                list1 = list1.next;
            } else if (list1.val > list2.val) {
                currNode.next = list2;
                list2 = list2.next;
            } else {
                currNode.next = list1;
                list1 = list1.next;
            }
            currNode = currNode.next;
        }

        return headNode.next;
    }
}
