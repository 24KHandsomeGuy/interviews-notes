package com.bibabo.demo;

import java.util.HashMap;
import java.util.Map;

/**
 * @author fukuixiang
 * @date 2020/12/4
 * @time 17:05
 * @description
 */
public class BooleanTest {


    public static void main(String[] args) {

        Map map = new HashMap();
        boolean b = map == null && 1 != 1 || false;
        System.out.println(b);



    }

}
