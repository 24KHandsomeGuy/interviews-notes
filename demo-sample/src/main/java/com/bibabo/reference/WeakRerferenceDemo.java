package com.bibabo.reference;

import java.lang.ref.WeakReference;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 17:55
 * @Description:
 * TODO 弱引用。只要gc就会回收
 */
public class WeakRerferenceDemo {

    public static void main(String[] args) {
        // 我们需要通过WeakReference来创建弱引用
        WeakReference<ReferenceObject> objectWr = new WeakReference<>(new ReferenceObject());
        System.out.println("Weak reference object`s memory address is: " + objectWr);
        System.out.println("Be associated with weak reference object`s memory address is: " + objectWr.get());

        System.gc();

        // gc后，弱引用对象还在，但是通过弱引用对象创建的对象就被回收了
        System.out.println("After gc, Weak reference object`s memory address is: " + objectWr);
        System.out.println("After gc, Be associated with weak reference object`s memory address is: " + objectWr.get());
    }
}
