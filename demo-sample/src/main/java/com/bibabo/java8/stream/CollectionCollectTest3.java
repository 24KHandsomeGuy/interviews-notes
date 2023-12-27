package com.bibabo.java8.stream;

import cn.hutool.core.collection.CollUtil;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/12/21 17:25
 * @Description
 */
public class CollectionCollectTest3 {

    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < 10000; i++) {
            int finalI = i;
            new Thread(() -> {
                list.add(finalI);
            }).start();
        }
        System.out.println(list.size());
    }
}
