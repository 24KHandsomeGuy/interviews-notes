package com.bibabo.collections.list.thread;

import java.util.LinkedList;
import java.util.concurrent.CountDownLatch;

/**
 * @author fukuixiang
 * @date 2021/3/9
 * @time 11:24
 * @description
 */
public class LinkedListThreadTest {

    public static void main(String[] args) throws InterruptedException {

        LinkedList<Integer> linkedList = new LinkedList<>();

        int size = 1000;
        CountDownLatch countDownLatch = new CountDownLatch(size);

        for (int i = 0;i < size; i ++) {
            final int j = i;
            new Thread(() -> {
                try {
                    linkedList.add(j);
                } catch (RuntimeException e) {
                    System.out.println(e);
                } finally {
                    countDownLatch.countDown();
                }
            }).start();
        }

        countDownLatch.await();
        System.out.println(linkedList.size());
        int total = 0;
        for (int i : linkedList) {
            total += i;
        }

        System.out.println(total);

    }

}
