package com.bibabo.algorithm.leetcode.No36IsValidSudoku;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 17:09
 * @Description: leetcode官方解法优化版本1，int二维数组优化为boolean1字节存储
 */
public class IsValidSudoku04 {

    public boolean isValidSudoku(char[][] board) {
        boolean[][] rows = new boolean[9][9];
        boolean[][] coulmns = new boolean[9][9];
        boolean[][] subBoards = new boolean[9][9];
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                char c = board[i][j];
                if (c == '.') {
                    continue;
                }
                // char转成int
                int idx = c - '0' - 1;
                if (rows[i][idx] || coulmns[j][idx] || subBoards[i / 3 * 3 + j / 3][idx]) {
                    // hash表已经存在
                    return false;
                } else {
                    rows[i][idx] = true;
                    coulmns[j][idx] = true;
                    subBoards[i / 3 * 3 + j / 3][idx] = true;
                }
            }
        }
        return true;
    }
}
