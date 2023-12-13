package com.bibabo.iterator.customer;

import com.bibabo.iterator.standard.AbstractObjectList;
import com.bibabo.iterator.standard.ConcreteObjectList;
import com.bibabo.iterator.standard.PageIterator;

import java.util.ArrayList;
import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/29 22:05
 * @Description
 */
public class MyPageIteratorTest {

    public static void main(String[] args) {

        List<String> objects = new ArrayList<>();
        objects.add("1");
        objects.add("2");
        objects.add("3");
        objects.add("4");
        objects.add("5");
        objects.add("6");
        objects.add("7");
        objects.add("8");
        objects.add("9");
        MyConcretePageIterator<String> myConcretePageIterator = new MyConcretePageIterator<>(objects, 4);

        while (!myConcretePageIterator.isLastPage()) {
            System.out.println("下一页：");
            List<String> objPage = myConcretePageIterator.nextPage();
            System.out.println(objPage);
        }
        System.out.println();

        while (!myConcretePageIterator.isFirstPage()) {
            System.out.println("上一页：");
            List<String> objPage = myConcretePageIterator.previousPage();
            System.out.println(objPage);
        }
    }
}
