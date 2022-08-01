package com.bibabo.algorithm.leetcode.No3LongestSubstringWithoutRepeatingCharacters;

import java.util.HashSet;
import java.util.Set;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/28 10:29
 * @Description: 暴力求解
 */
public class LongestSubstringWithoutRepeatingCharater01 {

    public int lengthOfLongestSubstring(String s) {
        int answer = 0;
        Character c = null;
        Set<Character> set = new HashSet<>();
        for (int i = 0; i < s.length(); i++) {
            for (int j = i; j < s.length(); j++) {
                c = s.charAt(j);
                if (set.contains(c)) {
                    set.clear();
                    break;
                }
                set.add(c);
                answer = set.size() > answer ? set.size() : answer;
            }
            if (answer == s.length()) return answer;
            set.clear();
        }
        return answer;
    }

}
