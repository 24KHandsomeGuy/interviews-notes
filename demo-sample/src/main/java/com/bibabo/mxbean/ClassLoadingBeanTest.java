package com.bibabo.mxbean;

import java.lang.management.ClassLoadingMXBean;
import java.lang.management.ManagementFactory;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/28 13:43
 * @Description
 */
public class ClassLoadingBeanTest {

    public static void main(String[] args) {
        System.out.println(collectClassLoadingInfo());
    }

    private static Map<String, Number> collectClassLoadingInfo() {
        ClassLoadingMXBean classLoadingMXBean = ManagementFactory.getClassLoadingMXBean();
        Map<String, Number> map = new LinkedHashMap<>();
        map.put("jvm.classloading.loaded.count", classLoadingMXBean.getLoadedClassCount());
        map.put("jvm.classloading.total.loaded.count", classLoadingMXBean.getTotalLoadedClassCount());
        map.put("jvm.classloading.unloaded.count", classLoadingMXBean.getUnloadedClassCount());
        return map;
    }
}
