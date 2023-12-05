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
        objects.add("ab");
        objects.add("cd");
        objects.add("ef");
        objects.add("gh");
        objects.add("ij");
        objects.add("kl");
        MyConcretePageIterator<String> myConcretePageIterator = new MyConcretePageIterator<>(objects, 2);

        while (!myConcretePageIterator.isLastPage()) {
            System.out.println("下一页：");
            List<String> objPage = myConcretePageIterator.getNextPage();
            System.out.println(objPage);
            myConcretePageIterator.nextPage();
        }
        System.out.println();

        while (!myConcretePageIterator.isFirstPage()) {
            System.out.println("上一页：");
            List<String> objPage = myConcretePageIterator.getPreviousPage();
            System.out.println(objPage);
            myConcretePageIterator.previousPage();
        }
    }
}
