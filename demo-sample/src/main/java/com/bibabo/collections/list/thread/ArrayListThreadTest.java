package com.bibabo.collections.list.thread;

import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;

/**
 * @author fukuixiang
 * @date 2021/3/9
 * @time 11:24
 * @description
 */
public class ArrayListThreadTest {

    public static void main(String[] args) throws InterruptedException {

        ArrayList<Integer> arrayList = new ArrayList<>();

        int size = 10000;
        CountDownLatch countDownLatch = new CountDownLatch(size);

        for (int i = 0;i < size; i ++) {
            final int j = i;
            new Thread(() -> {
                try {
                    arrayList.add(j);
                } finally {
                    countDownLatch.countDown();
                }
            }).start();
        }

        countDownLatch.await();
        System.out.println(arrayList.size());

    }

}
