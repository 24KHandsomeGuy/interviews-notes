package com.bibabo.collections.list;

import java.util.LinkedList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2020/9/23
 * @time 15:27
 * @description
 */
public class LinkedListTest {

    public static void main(String[] args) {

        List<Integer> list = new LinkedList<>();
        list.add(10);
        list.add(11);
        list.add(12);

        list.set(1,111);
        list.remove(new Integer(10));

        System.out.println(list.get(1));

        for (Integer e : list) {
            System.out.println(e);
        }

    }

}
