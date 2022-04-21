package com.bibabo.collections.set;

import com.bibabo.collections.map.Demo;

import java.util.Iterator;
import java.util.TreeSet;

/**
 * @author fukuixiang
 * @date 2020/6/5
 * @time 17:31
 * @description
 */
public class TreeSetDemo {

    public static void main(String[] args) {

        TreeSet<Demo> set = new TreeSet<>();
        set.add(new Demo(1, "张三"));
        set.add(new Demo(1, "李四"));
        set.add(new Demo(1, "张三"));
        set.add(new Demo(10, "王十"));
        set.add(new Demo(4, "赵四"));
        System.out.println(set.size());

        for (Iterator<Demo> iterator = set.iterator(); iterator.hasNext(); ) {
            Demo demo = iterator.next();
            System.out.println(demo);
        }
    }


}
