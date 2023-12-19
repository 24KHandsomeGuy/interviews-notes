package com.bibabo.iterator.customer;

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
        NewListConcretePageIterator<String> newListConcretePageIterator = new NewListConcretePageIterator<>(objects, 4);

        while (!newListConcretePageIterator.isLastPage()) {
            System.out.println("下一页：");
            List<String> objPage = newListConcretePageIterator.nextPage();
            System.out.println(objPage);
        }
        System.out.println();

        while (!newListConcretePageIterator.isFirstPage()) {
            System.out.println("上一页：");
            List<String> objPage = newListConcretePageIterator.previousPage();
            System.out.println(objPage);
        }
        System.out.println("楚河汉界：");
        SubListConcretePageIterator<String> subListConcretePageIterator = new SubListConcretePageIterator<>(objects, 4);
        while (!subListConcretePageIterator.isLastPage()) {
            System.out.println("下一页：");
            List<String> objPage = subListConcretePageIterator.nextPage();
            System.out.println(objPage);
        }
        System.out.println();

        while (!subListConcretePageIterator.isFirstPage()) {
            System.out.println("上一页：");
            List<String> objPage = subListConcretePageIterator.previousPage();
            System.out.println(objPage);
        }
    }
}
