package com.bibabo.algorithm.leetcode.No73SetMatrixZeroes;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/15 16:35
 * @Description: 官方的方法2，借助第一行、第一列降低空间复杂度O(1)
 */
public class SetMatrixZeroes03 {

    public void setZeroes(int[][] matrix) {

        int m = matrix.length, n = matrix[0].length;

        boolean row0Flag = false, column0Flag = false;
        // 记录第一行是否出现过0
        for (int i = 0; i < n; i++) {
            if (matrix[0][i] == 0) {
                row0Flag = true;
            }
        }
        // 记录第一列是否出现过0
        for (int i = 0; i < m; i++) {
            if (matrix[i][0] == 0) {
                column0Flag = true;
            }
        }

        // 使用第一行、第一列记录当前行列是否存在0
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (matrix[i][j] == 0) {
                    matrix[i][0] = 0;
                    matrix[0][j] = 0;
                }
            }
        }
        // 判断当前元素，所在的第一个行列是否存在0
        for (int i = 1; i < m; i++) {
            for (int j = 1; j < n; j++) {
                if (matrix[i][0] == 0 || matrix[0][j] == 0) {
                    matrix[i][j] = 0;
                }
            }
        }

        // 最后计算第一行，第一列
        if (row0Flag) {
            for (int i = 0; i < n; i++) {
                matrix[0][i] = 0;
            }
        }
        if (column0Flag) {
            for (int i = 0; i < m; i++) {
                matrix[i][0] = 0;
            }
        }
    }

}
