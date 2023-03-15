package com.bibabo.algorithm.leetcode.L0005LongestPalindromicSubstring;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/2 15:33
 * @Description: 中心扩展法
 * 我们枚举所有的「回文中心」并尝试「扩展」，直到无法扩展为止，此时的回文串长度即为此「回文中心」下的最长回文串长度。
 */
public class CenterExpansionSolution {

    public static void main(String[] args) {
        String s = "babad";
        longestPalindrome(s);
    }

    public static String longestPalindrome(String s) {
        if (s == null || s.length() < 2) return s;
        // 初始、终止下标
        int start = 0, end = 0;
        char[] charArray = s.toCharArray();
        for (int i = 0; i < s.length(); i++) {
            // 奇数，以自身为起点向两边扩散
            int lengthOdd = expandAroundfromCenter(charArray, i, i);
            // 偶数，以自身加上自身 + 1这一对向两边扩散
            int lengthEven = expandAroundfromCenter(charArray, i, i + 1);
            int maxLength = Math.max(lengthOdd, lengthEven);
            if (maxLength > end - start) {
                // 如果是偶数，必须减一，否则可能会出现-1
                start = i - (maxLength - 1) / 2;
                end = i + maxLength / 2;
            }
        }
        return s.substring(start, end + 1);
    }

    /**
     * 向两边扩散寻找至最大长度
     */
    static int expandAroundfromCenter(char[] charArray, int left, int right) {
        while (left >= 0 && right < charArray.length && charArray[left] == charArray[right]) {
            --left;
            ++right;
        }
        // 最后一次会多加减，如果不多加减，求长度则是right - left + 1
        // 多加减则right - left - 1
        return right - left - 1;
    }

}
