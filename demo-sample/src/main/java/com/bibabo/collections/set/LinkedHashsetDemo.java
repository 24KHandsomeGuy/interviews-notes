package com.bibabo.collections.set;

import collections.map.Demo;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;

/**
 * @author fukuixiang
 * @date 2020/6/5
 * @time 17:31
 * @description
 */
public class LinkedHashsetDemo {

    public static void main(String[] args) {

        LinkedHashSet<Demo> set = new LinkedHashSet<>();
        set.add(new Demo(1, "张三"));
        set.add(new Demo(2, "李四"));
        set.add(new Demo(1, "张三"));
        System.out.println(set.size());

        for (Iterator<Demo> iterator = set.iterator(); iterator.hasNext(); ) {
            Demo demo = iterator.next();
            System.out.println(demo);
        }
    }


}
