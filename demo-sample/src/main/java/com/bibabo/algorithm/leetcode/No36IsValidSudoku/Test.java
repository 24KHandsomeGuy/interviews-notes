package com.bibabo.algorithm.leetcode.No36IsValidSudoku;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 17:14
 * @Description:
 */
public class Test {

    public static void main(String[] args) {
        char[][] chars = new char[9][9];
        chars[0] = new char[]{'.','.','.','.','5','.','.','1','.'};
        chars[1] = new char[]{'.','4','.','3','.','.','.','.','.'};
        chars[2] = new char[]{'.','.','.','.','.','3','.','.','1'};
        chars[3] = new char[]{'8','.','.','.','.','.','.','2','.'};
        chars[4] = new char[]{'.','.','2','.','7','.','.','.','.'};
        chars[5] = new char[]{'.','1','5','.','.','.','.','.','.'};
        chars[6] = new char[]{'.','.','.','.','.','2','.','.','.'};
        chars[7] = new char[]{'.','2','.','9','.','.','.','.','.'};
        chars[8] = new char[]{'.','.','4','.','.','.','.','.','.'};


        IsValidSudoku05 isValidSudoku03 = new IsValidSudoku05();
        System.out.println(isValidSudoku03.isValidSudoku(chars));
    }
}
