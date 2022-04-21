package com.bibabo.jvm;/*
package jvm;

import sun.misc.Unsafe;

import java.lang.reflect.Field;

*/
/**
 * @author fukuixiang
 * @date 2021/3/22
 * @time 19:10
 * @description
 *//*

public class DirectMemoryOverFlowErrorTest {

    public static void main(String[] args) throws IllegalAccessException {

        DirectMemoryOverFlowErrorTest test = new DirectMemoryOverFlowErrorTest();
        System.out.println(unsafe.compareAndSwapObject(test, OBJ, new Object(), new Object()));

        for (int i = 0; i < 30000 ; i ++) {
            unsafe.allocateMemory(1024 * 1024);// 分配直接内存
        }

    }

    Object obj2;

    static Unsafe unsafe;

    private static long OBJ;

    static {
        try {
            Field field = Unsafe.class.getDeclaredFields()[0];
            field.setAccessible(true);
            Unsafe unsafe = null;
            unsafe = (Unsafe) field.get(null);
            DirectMemoryOverFlowErrorTest.unsafe = unsafe;
            OBJ = unsafe.objectFieldOffset(DirectMemoryOverFlowErrorTest.class.getDeclaredField("obj2"));
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
            throw new Error(e);
        }
    }

}
*/
