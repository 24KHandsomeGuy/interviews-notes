package com.bibabo.algorithm.leetcode.No73SetMatrixZeroes;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/15 16:36
 * @Description:
 */
public class Test {

    public static void main(String[] args) {
        int[][] matrix = new int[3][4];
        matrix[0] = new int[]{0,1,2,0};
        matrix[1] = new int[]{3,4,5,2};
        matrix[2] = new int[]{1,3,1,5};
        SetMatrixZeroes01 setMatrixZeroes01 = new SetMatrixZeroes01();
        setMatrixZeroes01.setZeroes(matrix);
    }
}
