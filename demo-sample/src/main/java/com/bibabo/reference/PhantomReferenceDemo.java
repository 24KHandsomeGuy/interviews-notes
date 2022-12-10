package com.bibabo.reference;

import java.lang.ref.PhantomReference;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 18:03
 * @Description: TODO 虚引用。需要通过PhantomReference对象和ReferenceQueue实现
 * 无论是否gc，都获取不到通过PhantomReference创建的对象。其仅用于管理直接内存，起到通知的作用。
 * 背景：因为垃圾回收器只能管理JVM内部的内存，无法直接管理系统内存的。对于一些存放在系统内存中的数据，JVM会创建一个引用指向这部分内存。
 */
public class PhantomReferenceDemo {

    /**
     * 虚引用需要的队列
     */
    private static final ReferenceQueue<ReferenceObject> QUEUE = new ReferenceQueue<>();

    public static void main(String[] args) {

        // 我们需要通过WeakReference来创建虚引用
        PhantomReference<ReferenceObject> objectPr = new PhantomReference<>(new ReferenceObject(), QUEUE);
        System.out.println("虚引用objectPr的地址：" + objectPr);
        System.out.println("虚引用objectPr关联的oneObject对象的地址：" + objectPr.get());

        // 触发gc，然后检查队列中是否有虚引用
        while (true) {
            System.gc();
            Reference<? extends ReferenceObject> poll = QUEUE.poll();
            if (poll != null) {
                System.out.println("gc后，虚引用objectPr的地址：" + poll);
                System.out.println("gc后，虚引用objectPr关联的oneObject对象的地址：" + poll.get());
                break;
            }
        }

    }
}
