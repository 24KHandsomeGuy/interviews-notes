package com.bibabo.reference;

import java.util.WeakHashMap;
import java.util.concurrent.TimeUnit;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 17:55
 * @Description: TODO 弱引用。只要gc就会回收
 */
public class WeakHashMapDemo {

    public static void main(String[] args) throws InterruptedException {
        // 我们需要通过WeakReference来创建弱引用
        WeakHashMap<Integer, Integer> weakHashMap = new WeakHashMap<>();
        weakHashMap.put(10086, 10086);
        weakHashMap.put(2, 2);// 享元模式 cache 不会被gc
        System.out.println("Weak hash map contains obj size is: " + weakHashMap.size());

        System.gc();
        TimeUnit.SECONDS.sleep(1);
        // gc后，弱引用对象还在，但是通过弱引用对象创建的对象就被回收了
        System.out.println("After gc, Weak hash map contains obj size is: " + weakHashMap.size());
    }
}
