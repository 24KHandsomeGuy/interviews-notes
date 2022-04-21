package com.bibabo.jvm;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2021/3/22
 * @time 11:25
 * @description
 */
public class HeapOverFlowErrorTest {

    public static void main(String[] args) {

        List<Object> list  = new ArrayList<>();
        while (true) {
            list.add(new Object());
        }

    }

}
