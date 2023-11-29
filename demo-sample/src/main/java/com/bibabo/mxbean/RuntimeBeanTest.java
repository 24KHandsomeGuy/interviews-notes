package com.bibabo.mxbean;

import java.lang.management.ManagementFactory;
import java.lang.management.RuntimeMXBean;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/28 11:40
 * @Description
 */
public class RuntimeBeanTest {

    public static void main(String[] args) {

        RuntimeMXBean runtimeMXBean = ManagementFactory.getRuntimeMXBean();
        System.out.println(runtimeMXBean.getBootClassPath());
        System.out.println(runtimeMXBean.getClassPath());
        System.out.println(runtimeMXBean.getLibraryPath());
        System.out.println(runtimeMXBean.getName());

    }
}
