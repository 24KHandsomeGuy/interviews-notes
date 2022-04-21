package com.bibabo.collections.list;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author fukuixiang
 * @date 2021/1/25
 * @time 14:46
 * @description
 */
public class ToArrayMethodTest {

    public static void main(String[] args) {


        List<String> list = new ArrayList<>();

        list.add("1");
        list.add("2");
        list.add("3");
        list.add("4");
        list.add("5");
        list.add("6");
        list.add("7");



        //String[] s = list.toArray(new String[7]);
        //String[] s = list.toArray(new String[0]);
        //String[] s = list.toArray(new String[10]);
        String[] s = new String[list.size()];
        System.out.println(s);
        s = list.toArray(s);
        System.out.println(s);

        String[] s2 = new String[]{"1", "10", "15"};
        List<String> list1 = Arrays.<String>asList(s);
        System.out.println(s2);

        Map map = new HashMap();
        map.put("1",2);
        map.put("10",20);
        map.forEach((k,v) -> {
            System.out.println( "k: " + k + "v:" + v);
        });
    }

}
