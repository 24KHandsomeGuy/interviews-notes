package com.bibabo.collections.list;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

/**
 * @author fukuixiang
 * @date 2021/3/9
 * @time 15:36
 * @description
 */
public class ArrayListTest2 {

    public static void main(String[] args) {

        ArrayList<Integer> list = new ArrayList<>(10);
        list.add(1);list.add(2);list.add(3);list.add(4);list.add(5);
        list.add(6);list.add(7);list.add(8);list.add(9);list.add(10);

        list.stream().filter(e -> (e & 1) == 1).forEach(e -> {System.out.println(ArrayListTest2.addOneHundred(e));});// predicate 奇数过滤掉
        list.forEach(e -> {System.out.println(ArrayListTest2.addOneHundred(e));});

        list.removeIf(e -> e == 3);
        list.spliterator();
        list.parallelStream();
    }

    public static int addOneHundred(int s) {
        return s + 100;
    }

}
