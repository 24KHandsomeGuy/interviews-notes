package com.bibabo.algorithm.leetcode.No36IsValidSudoku;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 17:09
 * @Description: 三个map，set判断是否存在重复元素
 * 这是我第一时间想到的办法，但是小九宫格的计算没想出来
 */
public class IsValidSudoku01 {

    public boolean isValidSudoku(char[][] board) {
        Map<Integer, Set<Integer>> rowMap = new HashMap<>();
        Map<Integer, Set<Integer>> columnMap = new HashMap<>();
        Map<Integer, Set<Integer>> boxMap = new HashMap<>();
        for (int i = 0; i < 9; i++) {
            rowMap.put(i, new HashSet<>());
            columnMap.put(i, new HashSet<>());
            boxMap.put(i, new HashSet<>());
        }
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                char c = board[i][j];
                if ('.' == c) {
                    continue;
                }
                int v = c - '0';
                if (rowMap.get(i).contains(v)) {
                    return false;
                } else {
                    rowMap.get(i).add(v);
                }
                if (columnMap.get(j).contains(v)) {
                    return false;
                } else {
                    columnMap.get(j).add(v);
                }
                // 计算出属于9个九宫格中的哪个
                int boxIdx = (i / 3) * 3 + (j / 3);
                if (boxMap.get(boxIdx).contains(v)) {
                    return false;
                } else {
                    boxMap.get(boxIdx).add(v);
                }
            }
        }
        return true;
    }
}
