package com.bibabo.algorithm.leetcode.No387FirstUniqueCharacterInaString;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/19 15:51
 * @Description:
 */
public class FirstUniqueCharaterInaString02 {

    public int firstUniqChar(String s) {
        int[] arr = new int[26];
        for (int i = 0; i < s.length(); i++) {
            arr[s.charAt(i) - 'a']++;
        }
        for (int i = 0; i < s.length(); i++) {
            if (arr[s.charAt(i) - 'a'] == 1) {
                return i;
            }
        }
        return -1;
    }
}
