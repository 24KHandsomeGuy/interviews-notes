package com.bibabo.algorithm.leetcode.No383RansomNote;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/19 18:34
 * @Description:
 */
public class RansomNote02 {

    public boolean canConstruct(String ransomNote, String magazine) {
        int[] arr = new int[26];
        for (int i = 0; i < magazine.length(); i++) {
            arr[magazine.charAt(i) - 'a']++;
        }
        for (int i = 0; i < ransomNote.length(); i++) {
            if (--arr[ransomNote.charAt(i) - 'a'] < 0) {
                return false;
            }
        }
        return true;
    }
}
