package com.bibabo.algorithm.leetcode.No118PascalsTriangle;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 16:09
 * @Description:
 */
public class PascalsTriangle01 {

    public List<List<Integer>> generate(int numRows) {
        List<List<Integer>> yhTriangle = new ArrayList<>();
        for (int i = 0; i < numRows; i++) {
            List<Integer> list = new ArrayList<>();
            yhTriangle.add(list);
            for (int j = 0; j <= i; j++) {
                // 头尾为1
                if (j == 0 || j == i) {
                    list.add(1);
                    continue;
                }
                list.add(yhTriangle.get(i - 1).get(j - 1) + yhTriangle.get(i - 1).get(j));
            }
        }
        return yhTriangle;
    }

}
