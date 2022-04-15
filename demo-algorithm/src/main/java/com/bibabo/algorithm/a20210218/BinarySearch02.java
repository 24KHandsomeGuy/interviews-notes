package com.bibabo.algorithm.a20210218;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2021/2/18
 * @time 14:30
 * @description
 */
public class BinarySearch02 {

    public static void main(String[] args) {
        int key = 0;
        List<Integer> list = new ArrayList<>();
        for (int i = 1; i <= args.length; i ++) {
            if (i == 1) {
                key = Integer.valueOf(args[i - 1]).intValue();
            }
            list.add(Integer.valueOf(args[i - 1]));
        }

        int index = rank(list, key);

    }

    private static int rank(List<Integer> list, int key) {
        for (Integer item : list) {

        }

        return 0;
    }

}
