package com.bibabo.algorithm.leetcode.No242ValidAnagram;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/19 19:05
 * @Description:
 */
public class ValidAnagram01 {

    public boolean isAnagram(String s, String t) {
        Map<Character, Integer> map = new HashMap<>();
        if (s.length() != t.length()) return false;
        for (int i = 0; i < s.length(); i ++) {
            map.put(s.charAt(i), map.getOrDefault(s.charAt(i), 0) + 1);
        }
        for (int i = 0; i < t.length(); i++) {
            if (!map.containsKey(t.charAt(i)) || map.get(t.charAt(i)) <= 0) {
                return false;
            }
            map.put(t.charAt(i), map.get(t.charAt(i)) - 1);
        }
        return true;
    }
}
