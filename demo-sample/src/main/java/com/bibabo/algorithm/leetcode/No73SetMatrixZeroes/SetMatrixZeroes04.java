package com.bibabo.algorithm.leetcode.No73SetMatrixZeroes;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/15 16:35
 * @Description: 官方的方法3，借助第一列降低空间复杂度O(1)
 */
public class SetMatrixZeroes04 {

    public void setZeroes(int[][] matrix) {

        int m = matrix.length, n = matrix[0].length;
        boolean col0Flag = false;

        for (int i = 0; i < m; i++) {
            if (matrix[i][0] == 0) {
                col0Flag = true;
            }

            for (int j = 1; j < n; j++) {
                if (matrix[i][j] == 0) {
                    matrix[i][0] = matrix[0][j] = 0;
                }
            }
        }

        for (int i = m - 1; i >= 0; i--) {
            for (int j = 1; j < n; j++) {
                if (matrix[i][0] == 0 || matrix[0][j] == 0) {
                    matrix[i][j] = 0;
                }
            }
            if (col0Flag) {
                matrix[i][0] = 0;
            }
        }
    }

}
