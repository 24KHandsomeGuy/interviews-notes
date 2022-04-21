package com.bibabo.collections.list;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2020/12/4
 * @time 11:03
 * @description
 */
public class SubListTest {

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();

        list.add("1");
        list.add("2");
        list.add("3");
        list.add("4");
        list.add("5");
        list.add("6");
        list.add("7");


        final int limitQty = 4;
        int numberOfCalls = list.size() % limitQty == 0 ? list.size() / limitQty : list.size() / limitQty + 1;
        int start;
        int end;
        for (int i = 0; i < numberOfCalls; i++) {
            start = i * limitQty;
            end = (i + 1) * limitQty;
            if (numberOfCalls - 1 == i) {
                end = list.size();
            }
            List<String> subList = list.subList(start, end);
            System.out.println(subList.toString());
        }


    }

}
