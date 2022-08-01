package com.bibabo.algorithm.leetcode.No3LongestSubstringWithoutRepeatingCharacters;

import java.util.HashSet;
import java.util.Set;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/28 10:29
 * @Description: 滑动窗口，起始值为for循环i，终止值为end
 */
public class LongestSubstringWithoutRepeatingCharater03 {

    public int lengthOfLongestSubstring(String s) {
        int answer = 0;

        Set<Character> set = new HashSet<>();
        // 滑动窗口的终止值
        int end = -1;
        // 滑动窗口的起始值
        for (int start = 0; start < s.length(); start++) {
            if (start != 0) {
                // 删除掉前一个，与start同步向后移动
                set.remove(s.charAt(start - 1));
            }

            while (end + 1 < s.length() && !set.contains(s.charAt(end + 1))) {
                set.add(s.charAt(end + 1));
                end++;
            }
            answer = Math.max(answer, end - start + 1);
        }
        return answer;
    }

}
