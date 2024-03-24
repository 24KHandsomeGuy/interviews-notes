package com.bibabo.collections.list;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/7 20:22
 * @Description
 */
public class StreamTest {

    public static void main(String[] args) {

        List<String> list = new ArrayList<>();
        list.add("1");
        list.add("2");

        Stream<String> stream = list.stream();
        List<Integer> list1 = stream.map(Integer::parseInt).collect(Collectors.toList());
        stream.forEach(System.out::println);

        System.out.println(list1);
    }
}
