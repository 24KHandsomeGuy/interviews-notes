package com.bibabo.algorithm.leetcode.No3LongestSubstringWithoutRepeatingCharacters;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/28 10:29
 * @Description: 滑动窗口，起始值为start，终止值为for循环i
 */
public class LongestSubstringWithoutRepeatingCharater02 {

    public int lengthOfLongestSubstring(String s) {
        int answer = 0;
        // key : char value : index最后一次出现的下标
        Map<Character, Integer> map = new HashMap<>();
        // 滑动窗口的起始值
        int start = 0;
        // 滑动窗口的终止值
        for (int end = 0; end < s.length(); end++) {
            char c = s.charAt(end);
            if (map.containsKey(c)) {
                // 找到重复元素的位置，start向前滑1
                // 判断现在的位置和滑动后的位置谁更大
                // 何时start会更大？？？abbcda
                start = Math.max(map.get(c) + 1, start);
            }
            answer = Math.max(answer, end - start + 1);
            map.put(c, end);
        }
        return answer;
    }

}
