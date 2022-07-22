package com.bibabo.algorithm.leetcode.No242ValidAnagram;

import java.util.Arrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/19 19:05
 * @Description:
 */
public class ValidAnagram03 {

    public boolean isAnagram(String s, String t) {
        if (s.length() != t.length()) return false;
        char[] str1 = s.toCharArray();
        char[] str2 = t.toCharArray();
        Arrays.sort(str1);
        Arrays.sort(str2);
        return Arrays.equals(str1, str2);
    }
}
