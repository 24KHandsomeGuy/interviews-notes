package com.bibabo.algorithm.leetcode.No141LinkedListCycle;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/20 10:20
 * @Description: hash表
 */
public class LinkedListCycle01 {

    public boolean hasCycle(ListNode head) {
        Map<ListNode, Integer> map = new HashMap<>();
        int index = 0;
        while (head != null) {
            if (map.containsKey(head)) {
                return true;
            } else {
                map.put(head, index);
            }
            head = head.next;
        }
        return false;
    }
}
