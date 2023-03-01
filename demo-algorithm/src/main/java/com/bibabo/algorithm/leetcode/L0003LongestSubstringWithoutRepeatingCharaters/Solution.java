package com.bibabo.algorithm.leetcode.L0003LongestSubstringWithoutRepeatingCharaters;

import java.util.HashSet;
import java.util.Set;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/1 16:35
 * @Description:
 */
public class Solution {

    public static void main(String[] args) {
        String s = "dvdf";
        lengthOfLongestSubstring(s);
    }

    public static int lengthOfLongestSubstring(String s) {
        if (s == null) return 0;
        int length = s.length();
        // 存的是，以i为起点，不重复的已经滑动的字符
        Set<Character> set = new HashSet<>();
        int maxSubstringLength = 0;
        // 滑动下标
        int slidingIndex = 0;
        for (int i = 0; i < length; i++) {
            // 删除已经滑动过的字符
            if (i > 0) {
                set.remove(s.charAt(i - 1));
            }
            // 1.不能越界 2.遇到重复字符，停止滑动
            while (slidingIndex < length && !set.contains(s.charAt(slidingIndex))) {
                set.add(s.charAt(slidingIndex));
                slidingIndex++;
            }
            maxSubstringLength = Math.max(maxSubstringLength, slidingIndex - i);
        }

        return maxSubstringLength;
    }

}
