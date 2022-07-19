package com.bibabo.algorithm.leetcode.No36IsValidSudoku;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 17:09
 * @Description: 超暴力解法
 */
public class IsValidSudoku02 {

    public boolean isValidSudoku(char[][] board) {
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board[0].length; j++) {
                if (board[i][j] >= '0' && board[i][j] <= '9') {
                    // 验证行
                    for (int k = 0; k < 9; k++) {
                        if (board[i][k] == board[i][j] && j != k) {
                            return false;
                        }
                    }
                    // 验证列
                    for (int k = 0; k < 9; k++) {
                        if (board[k][j] == board[i][j] && i != k) {
                            return false;
                        }
                    }
                    // 验证小九宫格
                    // 找到当前i、j属于哪个九宫格，遍历这个九宫格
                    int rowStart = (i / 3) * 3;// 找到九宫格起始行
                    int rowEnd = rowStart + 3;
                    int columnStart = (j / 3) * 3;// 找到九宫格起始列
                    int columnEnd = columnStart + 3;
                    for (int k1 = rowStart; k1 < rowEnd; k1++) {
                        for (int k2 = columnStart; k2 < columnEnd; k2++) {
                            if (board[k1][k2] == board[i][j] && k1 != i && k2 != j) {
                                return false;
                            }
                        }
                    }
                }
            }
        }
        return true;
    }
}
