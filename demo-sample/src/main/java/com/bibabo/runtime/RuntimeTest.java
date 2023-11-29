package com.bibabo.runtime;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/28 11:23
 * @Description
 */
public class RuntimeTest {

    public static void main(String[] args) {
        System.out.println(Runtime.getRuntime().availableProcessors());

        System.out.println(Runtime.getRuntime().freeMemory());

        System.out.println(Runtime.getRuntime().maxMemory());
    }
}
