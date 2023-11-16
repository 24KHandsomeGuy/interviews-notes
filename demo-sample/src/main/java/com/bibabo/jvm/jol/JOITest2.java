package com.bibabo.jvm.jol;

import org.openjdk.jol.info.ClassLayout;
import org.openjdk.jol.info.GraphLayout;

import java.util.HashMap;
import java.util.Map;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/10/25 19:49
 * @Description
 */
public class JOITest2 {

    public static void main(String[] args) {
        Map<String, String> map = new HashMap<>();
        map.put("1", "1");
        System.out.println(GraphLayout.parseInstance(map).totalSize());// 打印对象总大小


        Map<String, String> map2 = new HashMap<>(0);
        map2.put("1", "1");
        System.out.println(GraphLayout.parseInstance(map2).totalSize());// 打印对象总大小
    }
}
