package com.bibabo.algorithm.leetcode.No566MatrixReshape;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 15:12
 * @Description:
 */
public class MatrixReshape03 {

    public int[][] matrixReshape(int[][] mat, int r, int c) {
        int rowLength = mat.length;
        int colLength = mat[0].length;
        if (rowLength * colLength != r * c) {
            return mat;
        }
        int[][] reshapeArr = new int[r][c];
        for (int i = 0; i < rowLength * colLength; i++) {
            reshapeArr[i / c][i % c] = mat[i / colLength][i % colLength];
        }
        return reshapeArr;
    }
}
