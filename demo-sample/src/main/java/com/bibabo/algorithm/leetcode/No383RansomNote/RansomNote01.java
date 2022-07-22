package com.bibabo.algorithm.leetcode.No383RansomNote;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/19 18:34
 * @Description:
 */
public class RansomNote01 {

    public boolean canConstruct(String ransomNote, String magazine) {
        Map<Character, Integer> map = new HashMap<>();
        for (int i = 0; i < magazine.length(); i++) {
            map.put(magazine.charAt(i), map.getOrDefault(magazine.charAt(i), 0) + 1);
        }
        for (int i = 0; i < ransomNote.length(); i++) {
            if (!map.containsKey(ransomNote.charAt(i))) {
                return false;
            }
            int times = map.get(ransomNote.charAt(i));
            if (times <= 0) {
                return false;
            }
            map.put(ransomNote.charAt(i), --times);
        }
        return true;
    }
}
