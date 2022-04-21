package com.bibabo.collections.list;

import java.util.ArrayList;

/**
 * @author fukuixiang
 * @date 2020/9/21
 * @time 10:20
 * @description
 */
public class ArrayListTest3 {

    public static void main(String[] args) {


        ArrayList<String> arrayList = new ArrayList();

        arrayList.add("");
        arrayList.add("");
        arrayList.add("1");
        arrayList.add(null);
        System.out.println(arrayList);
    }

    public static boolean multipleOf2(int i) {
        return (i & 1) == 0;
    }

    public static int addOneHundred(int i) {
        return i + 100;
    }

}
