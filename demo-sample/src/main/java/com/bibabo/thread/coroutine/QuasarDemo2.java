package com.bibabo.thread.coroutine;

import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.strands.Strand;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/2 17:57
 * @Description:
 */
public class QuasarDemo2 {

    public static void main(String[] args) throws InterruptedException {

        int FiberNumber = 1;

        // CountDownLatch latch = new CountDownLatch(1);

        AtomicInteger counter = new AtomicInteger(0);

        for (int i = 0; i < FiberNumber; i++) {
            new Fiber(() -> {
                int count = counter.get();
                System.out.println("hello" + count);
                if (counter.incrementAndGet() == FiberNumber) {
                    System.out.println("done");
                }
                // 会报错
                // Thread.sleep(20000);
                Strand.sleep(1000);
                System.out.println("over" + count);
            }).start();
        }
        Thread.sleep(30000);
    }
}
