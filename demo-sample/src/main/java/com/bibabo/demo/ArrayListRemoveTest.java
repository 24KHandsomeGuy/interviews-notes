package com.bibabo.demo;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2020/11/26
 * @time 19:47
 * @description
 */
public class ArrayListRemoveTest {

    public static void main(String[] args) {

        /*List<String> strings = new ArrayList<>();
        strings.add("1");
        strings.add("2");

        for (String s : strings) {

            if ("1".equals(s)) {
                strings.remove("1");
            }
            System.out.println(s);
        }*/

       /* List<String> strings = new ArrayList<>();
        strings.add("1");
        strings.add("2");

        //重大bug
        for (int i = 0;i < strings.size();i ++) {

            if ("1".equals(strings.get(i))) {
                strings.remove("1");
            }
            System.out.println(strings.get(i));
        }*/

        /*List<String> strings = new ArrayList<>();
        strings.add("1");
        strings.add("2");

        //重大bug
        for (int i = 0;i < strings.size();i ++) {

            if ("1".equals(strings.get(i))) {
                strings.remove(i);
            }
            System.out.println(strings.get(i));
        }*/

        List<String> strings = new ArrayList<>();
        strings.add("1");
        strings.add("2");

        //重大bug
        for (int i = 0;i < strings.size();i ++) {

            if ("2".equals(strings.get(i))) {
                strings.remove(i);
            }
            System.out.println(strings.get(i));
        }

    }

}
