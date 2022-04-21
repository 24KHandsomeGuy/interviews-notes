package com.bibabo.demo;

import org.apache.commons.lang3.StringUtils;

/**
 * @author fukuixiang
 * @date 2021/6/9
 * @time 16:00
 * @description
 */
public class DemoObjTest {

    public static void main(String[] args) {

        DemoObj demoObj = new DemoObj();
        demoObj.setName("adadasdadasdddddddddddddddddddddddddddddd");


        if (StringUtils.isNotBlank(demoObj.getName()) && demoObj.getName().length() > 10) {
            System.out.println(111);
        } else {
            System.out.println(222);
        }
    }

}
