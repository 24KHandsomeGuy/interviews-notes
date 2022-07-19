package com.bibabo.algorithm.leetcode.No566MatrixReshape;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 15:12
 * @Description:
 */
public class MatrixReshape02 {

    public int[][] matrixReshape(int[][] mat, int r, int c) {
        int rowLength = mat.length;
        int colLength = mat[0].length;
        if (rowLength * colLength != r * c) {
            return mat;
        }
        int rowIndex = 0;
        int colIndex = 0;
        int[][] reshapeArr = new int[r][c];
        for (int i = 0; i < rowLength; i++) {
            for (int j = 0; j < colLength; j++) {
                reshapeArr[rowIndex][colIndex] = mat[i][j];
                if (++colIndex >= c) {
                    colIndex = 0;
                    rowIndex++;
                }
            }
        }
        return reshapeArr;
    }
}
