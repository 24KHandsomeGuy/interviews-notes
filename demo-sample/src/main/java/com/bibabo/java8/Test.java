package com.bibabo.java8;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2022/3/4
 * @time 9:55
 * @description
 */
public class Test {


    public static void main(String[] args) throws IOException {

        List<Integer> list = new ArrayList<>();
        list.add(1);list.add(3);list.add(4);list.add(5);list.add(9);
        Object[] rst = list.stream().map(t -> "t" + t).toArray();//.collect(Collectors.toSet());
        System.out.println(rst.length);
    }
}
