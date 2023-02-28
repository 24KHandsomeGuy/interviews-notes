package com.bibabo.collections.list;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/1/31 11:05
 * @Description:
 */
public class IteratorTest {

    public static void main(String[] args) {
        Set<Integer> list1 = new HashSet<>();
        list1.add(1);
        list1.add(2);
        list1.add(3);
        Set<Integer> list2 = new HashSet<>();
        list2.add(1);
        list2.add(2);
        list2.add(4);

        for (Iterator<Integer> iterator1 = list1.iterator(); iterator1.hasNext(); ) {
            Integer i1 = iterator1.next();
            for (Iterator<Integer> iterator2 = list2.iterator(); iterator2.hasNext(); ) {
                Integer i2 = iterator2.next();
                if (i1.intValue() == i2.intValue()) {
                    iterator1.remove();
                    iterator2.remove();
                    break;
                }
            }
        }

        System.out.println(list1);
        System.out.println(list2);
    }
}
