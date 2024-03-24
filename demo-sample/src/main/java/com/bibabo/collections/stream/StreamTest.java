package com.bibabo.collections.stream;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/22 15:10
 * @Description
 */
public class StreamTest {

    public static void main(String[] args) {
        // 页的切割
        List<Integer> list = new ArrayList<>();
        //初始化list，一万条数据
        for (int i = 0; i < 20; i++) {
            list.add(i);
        }
        int limit = 5;
        List<Set<Integer>> setList = Stream.iterate(0, n -> n + 1)
                .limit((list.size() + limit - 1) / limit)
                .parallel()
                .map(a -> list.stream().skip((long) a * limit).limit(limit).parallel().collect(Collectors.toSet()))
                .collect(Collectors.toList());
        System.out.println(setList);

    }
}
