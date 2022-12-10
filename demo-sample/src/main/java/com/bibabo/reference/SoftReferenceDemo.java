package com.bibabo.reference;

import java.lang.ref.SoftReference;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 17:24
 * @Description:
 * TODO 软引用：内存不够了就会回收。运行时需要保证heap大小为35m，即小于实验中全部对象的大小，-Xmx35m。
 */
public class SoftReferenceDemo {

    public static void main(String[] args) {
        // 需要通过SoftReference来创建软引用
        SoftReference<ReferenceObject> objectSr = new SoftReference<>(new ReferenceObject());
        // 创建一个大小为20m的数组
        SoftReference<byte[]> arraySr = new SoftReference<>(new byte[1024 * 1024 * 20]);
        System.out.println("Soft reference object`s memory address is:" + objectSr);
        System.out.println("Be associated with soft reference object`s memory address is:" + objectSr.get());
        System.out.println("Used by filing memory array`s memory address is:" + arraySr.get());
        System.gc();
        System.out.println("After first garbage collected, be associated by soft reference object`s address is:" + objectSr.get());

        // 再创建另一个大小为20m的数组，使heap被填满，从而系统自动gc。如果内存依旧不够，会把已有的软引用关联的对象都回收掉。
        byte[] otherArray = new byte[1024 * 1024 * 20];

        // gc后，软引用对象还在，但是通过软引用对象创建的对象就被回收了
        System.out.println("Now heap is full, after system gc, the array`s memory address is:" + arraySr.get());
        System.out.println("The Soft reference object`s memory address is:" + objectSr);
        System.out.println("The be associated with soft reference object`s memory address is:" + objectSr.get());
    }
}
