package com.bibabo.algorithm.leetcode.L0005LongestPalindromicSubstring;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/2 15:32
 * @Description: 动态规划
 */
public class DynamicProgrammingSolution {

    public String longestPalindrome(String s) {
        if (s == null || s.length() < 2) return s;
        int beginIndex = 0;
        int maxLength = 1;
        // i为起点，j为向后依次比对的最长回文串结果
        boolean[][] resultArray = new boolean[s.length()][s.length()];
        // 单个字母位置都为回文串，记录true
        for (int i = 0; i < s.length(); i++) {
            resultArray[i][i] = true;
        }
        char[] charArray = s.toCharArray();
        // 外层循环为长度。第一轮：0和1比对，1和2比对，第二轮：0和2比对，1和3比对...
        for (int length = 2; length <= s.length(); length++) {
            // 内层循环为起点
            for (int i = 0; i < s.length(); i++) {
                // 计算j，也就是需要比对的下标
                int j = length + i - 1;
                // 越界跳出
                if (j >= s.length()) {
                    break;
                }
                if (charArray[i] != charArray[j]) {
                    resultArray[i][j] = false;
                } else {
                    // aa、aba
                    if (j - i < 3) {
                        resultArray[i][j] = true;
                    } else if (resultArray[i + 1][j - 1]) {
                        resultArray[i][j] = true;
                    } else {
                        resultArray[i][j] = false;
                    }
                    // 更新最大回文串标识
                    if (resultArray[i][j] && j - i + 1 > maxLength) {
                        beginIndex = i;
                        maxLength = j - i + 1;
                    }
                }
            }
        }
        return s.substring(beginIndex, beginIndex + maxLength);
    }
}
