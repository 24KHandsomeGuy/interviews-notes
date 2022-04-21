package com.bibabo.demo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2021/8/31
 * @time 18:30
 * @description
 */
public class IteratorDemo {

    public static void main(String[] args) {

        List<Integer> list1 = Arrays.asList(1, 2, 3, 4, 5);
        List<Integer> list2 = new ArrayList<>();
        list2.add(1);
        list2.add(5);

        Iterator<Integer> iterator2 = list2.iterator();
        for (Integer item : list1) {
            while (iterator2.hasNext()) {
                Integer item2 = iterator2.next();
                if (item != item2) {
                    continue;
                }
                iterator2.remove();
                break;
            }
        }
        System.out.println(list2);
    }
}
