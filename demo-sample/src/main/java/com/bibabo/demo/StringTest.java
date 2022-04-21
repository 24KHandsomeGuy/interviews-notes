package com.bibabo.demo;

import java.util.Arrays;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2020/11/26
 * @time 11:49
 * @description
 */
public class StringTest {

    public static void main(String[] args) {

        String s = "a" + "b" + "c";

        List<String> list = Arrays.asList("1","2");
        list.set(1,"3");
        System.out.println(list);
        list.add("33");

    }

    public final String tes() {
        return "";
    }

    public static class SubStringTest extends StringTest{


    }

}
