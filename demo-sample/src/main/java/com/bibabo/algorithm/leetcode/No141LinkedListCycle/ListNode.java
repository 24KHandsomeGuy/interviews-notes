package com.bibabo.algorithm.leetcode.No141LinkedListCycle;

import lombok.Data;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/20 10:20
 * @Description:
 */
@Data
public class ListNode {
    public int val;
    public ListNode next;

    public ListNode(int x) {
        val = x;
        next = null;
    }
    public ListNode(int x, ListNode next) {
        val = x;
        this.next = next;
    }
}
