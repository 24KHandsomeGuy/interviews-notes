package com.bibabo.iterator.standard;

import java.util.ArrayList;
import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/29 22:05
 * @Description
 */
public class PageIteratorTest {

    public static void main(String[] args) {
        AbstractObjectList concreteObjectList;
        PageIterator concretePageIterator;
        List<Object> objects = new ArrayList<>();
        objects.add("ab");
        objects.add("cd");
        objects.add("ef");
        objects.add("gh");
        objects.add("ij");
        objects.add("kl");
        concreteObjectList = new ConcreteObjectList(objects);
        concretePageIterator = concreteObjectList.createPageIterator();

        while (!concretePageIterator.isLastPage()) {
            System.out.println("下一页：");
            List<Object> objPage = concretePageIterator.getNextPage();
            System.out.println(objPage);
            concretePageIterator.nextPage();
        }
        System.out.println();

        while (!concretePageIterator.isFirstPage()) {
            System.out.println("上一页：");
            List<Object> objPage = concretePageIterator.getPreviousPage();
            System.out.println(objPage);
            concretePageIterator.previousPage();
        }
    }
}
