package com.bibabo.reference;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 17:17
 * @Description:
 * TODO 只要一个对象有强引用，垃圾回收器就不会进行回收。即便内存不够了，抛出OutOfMemoryError异常也不会回收。
 */
public class StrongReferenceDemo {

    public static void main(String[] args) {
        // 直接new一个对象，就是强引用
        SoftReferenceDemo object = new SoftReferenceDemo();
        System.out.println("Object`s memory address is:" + object);
        System.gc();
        System.out.println("After first garbage collected, object`s memory address is:" + object);
        object = null;
        System.gc();
        System.out.println("When object`s reference pointed null, object`s memory address is:" + object);
    }
}
