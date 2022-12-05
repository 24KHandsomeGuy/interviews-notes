package com.bibabo.algorithm.gupao.chris.stack.bytedance;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/2 10:53
 * @Description: 最大区间
 * 题目：求出，在所有区间中，每区间里最小值 * 其区间元素累计和的结果的中值最大的区间
 */
public class MaximumRange {

    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>();
        list.add(6);
        list.add(5);
        list.add(1);
        list.add(9);
        list.add(7);
        int[] indexArr = getMaximumRange(list);
        System.out.println(indexArr[0] + "----" + indexArr[1]);
    }

    public static int[] getMaximumRange(List<Integer> list) {
        int[] indexArr = new int[]{0, 0};
        int max = 0;
        for (int i = 0; i < list.size(); i++) {
            int e = list.get(i);
            int sum = e; // 区间元素累计和
            int min = e; // 区间最小值
            for (int j = i; j < list.size(); j++) {
                int e2 = list.get(j);
                if (j != i) {
                    sum = sum + e2;
                    min = Math.min(min, e2);
                }
                int val = sum * min;
                if (val > max) {
                    max = val;
                    indexArr[0] = i;
                    indexArr[1] = j;
                }
            }
        }
        System.out.println("max val is " + max);
        return indexArr;
    }
}
