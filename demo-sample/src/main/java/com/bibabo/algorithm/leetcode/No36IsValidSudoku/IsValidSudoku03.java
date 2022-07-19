package com.bibabo.algorithm.leetcode.No36IsValidSudoku;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 17:09
 * @Description: leetcode官方解法，多维数组作为hash表
 */
public class IsValidSudoku03 {

    public boolean isValidSudoku(char[][] board) {
        int[][] rows = new int[9][9];
        int[][] coulmns = new int[9][9];
        int[][][] subBoards = new int[3][3][9];
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                char c = board[i][j];
                if (c == '.') {
                    continue;
                }
                // char转成int
                int idx = c - '0' - 1;
                rows[i][idx] = ++rows[i][idx];
                // 行列转换
                coulmns[j][idx] = ++coulmns[j][idx];
                // 九宫格，计算当前数字在第几宫格
                subBoards[i / 3][j / 3][idx] = ++subBoards[i / 3][j / 3][idx];
                if (rows[i][idx] > 1 || coulmns[j][idx] > 1 || subBoards[i / 3][j / 3][idx] > 1) {
                    // hash表已经存在
                    return false;
                }
            }
        }
        return true;
    }
}
