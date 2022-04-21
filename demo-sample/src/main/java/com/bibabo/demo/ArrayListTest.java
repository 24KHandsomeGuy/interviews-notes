package com.bibabo.demo;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2021/3/22
 * @time 15:33
 * @description
 */
public class ArrayListTest {

    int age;

    public void setAge(int age) {
        this.age = age;
    }

    public int getAge() {
        return age;
    }

    public static void main(String[] args) {

        ArrayListTest arrayListTest = new ArrayListTest();

        List<ArrayListTest> arrayListTests = new ArrayList<>();

        for (int i = 0; i < 10 ; i ++) {
            arrayListTest.setAge(i);
            arrayListTests.add(arrayListTest);
        }

        System.out.println("大小" + arrayListTests.size());
        for (ArrayListTest test : arrayListTests) {
            System.out.println(test.hashCode());
        }
    }
}
