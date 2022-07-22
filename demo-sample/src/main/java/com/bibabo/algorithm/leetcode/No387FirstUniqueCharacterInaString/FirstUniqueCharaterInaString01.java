package com.bibabo.algorithm.leetcode.No387FirstUniqueCharacterInaString;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/19 15:51
 * @Description:
 */
public class FirstUniqueCharaterInaString01 {

    public int firstUniqChar(String s) {
        char[] chs = s.toCharArray();
        Map<Character, Integer> map = new HashMap<>();
        for (int i = 0; i < chs.length; i++) {
            map.put(chs[i], map.getOrDefault(chs[i], 0) + 1);
        }
        for (int i = 0; i < chs.length; i++) {
            if (map.get(chs[i]) <= 1) {
                return i;
            }
        }
        return -1;
    }
}
