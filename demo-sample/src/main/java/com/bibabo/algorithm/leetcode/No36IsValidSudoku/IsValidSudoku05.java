package com.bibabo.algorithm.leetcode.No36IsValidSudoku;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 17:09
 * @Description: leetcode官方解法优化版本2，boolean二维数组降为short二维数组存储，使用位运算，1代表数值出现过，0代表未出现过
 */
public class IsValidSudoku05 {

    public boolean isValidSudoku(char[][] board) {
        short[] rows = new short[9];
        short[] coulmns = new short[9];
        short[] subBoards = new short[9];
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                char c = board[i][j];
                if (c == '.') {
                    continue;
                }
                // char转成int
                int v = c - '0';
                // 把1按照 左移数值v位，用一个位来标识这个数字是否存在过，1代表存在 0代表不存在
                int bit = 1 << v;
                // 计算子九宫格下标
                int subBoardIdx = i / 3 * 3 + j / 3;
                // 如果a & b不等于0，说明有值已经存在过
                if ((bit & rows[i]) != 0 || (bit & coulmns[j]) != 0 || (bit & subBoards[subBoardIdx]) != 0) {
                    return false;
                } else {
                    // a | b出现的位置存储为1
                    rows[i] = (short) (rows[i] | bit);
                    coulmns[j] = (short) (coulmns[j] | bit);
                    subBoards[subBoardIdx] = (short) (subBoards[subBoardIdx] | bit);
                }
            }
        }
        return true;
    }
}
