package com.bibabo.algorithm.leetcode.No73SetMatrixZeroes;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/15 16:35
 * @Description: 自己写的方法
 */
public class SetMatrixZeroes01 {

    public void setZeroes(int[][] matrix) {
        Map<Integer, Integer> rowMap = new HashMap<>();
        Map<Integer, Integer> colMap = new HashMap<>();

        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[0].length; j++) {
                if (matrix[i][j] == 0) {
                    rowMap.put(i, 1);
                    colMap.put(j, 1);
                }
            }
        }

        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[0].length; j++) {
                if (rowMap.get(i) != null || colMap.get(j) != null) {
                    matrix[i][j] = 0;
                }
            }
        }
    }
}
