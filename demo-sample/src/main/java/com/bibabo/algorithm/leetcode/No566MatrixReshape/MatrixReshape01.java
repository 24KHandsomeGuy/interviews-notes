package com.bibabo.algorithm.leetcode.No566MatrixReshape;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 15:19
 * @Description:
 */
public class MatrixReshape01 {

    public int[][] matrixReshape(int[][] mat, int r, int c) {
        int rowLength = mat.length;
        int colLength = mat[0].length;
        if (rowLength * colLength != r * c) {
            return mat;
        }
        int[] elementsArr = new int[r * c];
        int elementsIdx = 0;
        for (int i = 0; i < rowLength; i++) {
            for (int j = 0; j < colLength; j++) {
                elementsArr[elementsIdx++] = mat[i][j];
            }
        }
        elementsIdx = 0;
        int[][] reshapeArr = new int[r][c];
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                reshapeArr[i][j] = elementsArr[elementsIdx++];
            }
        }
        return reshapeArr;
    }

}
