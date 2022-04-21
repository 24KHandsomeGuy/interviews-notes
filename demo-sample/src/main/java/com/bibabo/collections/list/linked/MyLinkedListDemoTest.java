package com.bibabo.collections.list.linked;

/**
 * @author fukuixiang
 * @date 2021/3/8
 * @time 19:30
 * @description 4种操作 增删改查 其中增加操作要多一些，头结点新增，尾结点新增，指定下标位置前新增，指定下标位置后新增
 */
public class MyLinkedListDemoTest<E> {

    public static void main(String[] args) {

        MyLinkedList<Integer> myLinkedList = new MyLinkedList();

        myLinkedList.addToHead(1);
        myLinkedList.addToHead(3);
        myLinkedList.addToHead(5);
        myLinkedList.addToTail(10);

        myLinkedList.addbefore(200,0);

        System.out.println(myLinkedList.delete(4));


        System.out.println(myLinkedList.getFirst());
        System.out.println(myLinkedList.getLast());
    }
}
