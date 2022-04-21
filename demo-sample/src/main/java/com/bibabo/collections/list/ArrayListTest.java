package com.bibabo.collections.list;

import java.util.ArrayList;

/**
 * @author fukuixiang
 * @date 2020/9/21
 * @time 10:20
 * @description
 */
public class ArrayListTest {

    public static void main(String[] args) {


        ArrayList<Integer> arrayList = new ArrayList();
        arrayList.add(3);
        arrayList.add(5);
        //arrayList.remove(new Integer(3));

        ArrayList<Integer> arrayList2 = new ArrayList(5);
        arrayList2.add(0);
        arrayList2.add(1);
        arrayList2.add(2);
        arrayList2.add(3);
        arrayList2.add(4);
        arrayList2.add(5);
        arrayList2.add(6);
        arrayList2.add(7);


        /*List<Integer> arrayList3 = arrayList2.subList(2,5);*/
        //arrayList3.forEach(s -> System.out.println(s));
        //arrayList3.replaceAll( t -> t + 10 );
        /*arrayList3.forEach(s -> System.out.println(s));
        System.out.println("----");*/
        /*arrayList3.removeIf(t -> t % 2 != 0);
        System.out.println("----");
        arrayList3.forEach(System.out::println);*/
       /* arrayList3.add(15);
        arrayList3.forEach(System.out::println);
        System.out.println("----");
        arrayList2.forEach(System.out::println);*/

        arrayList2.removeIf(ArrayListTest::multipleOf2);
        arrayList2.replaceAll(e -> e + 100);
        arrayList2.forEach(System.out::println);
    }

    public static boolean multipleOf2(int i) {
        return (i & 1) == 0;
    }

    public static int addOneHundred(int i) {
        return i + 100;
    }

}
