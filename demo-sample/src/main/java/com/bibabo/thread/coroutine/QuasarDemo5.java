package com.bibabo.thread.coroutine;

import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.strands.Strand;

import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/2 17:57
 * @Description:
 */
public class QuasarDemo5 {

    public static void main(String[] args) throws InterruptedException {

        int FiberNumber = 10;

        AtomicInteger counter = new AtomicInteger(0);

        for (int i = 0; i < FiberNumber; i++) {
            new Fiber(() -> {
                // 会报错
                // Thread.sleep(20000);
                int rst = new Random().nextInt(30000);
                Strand.sleep(rst);
                int count = counter.getAndIncrement();
                System.out.println(Thread.currentThread().getName() + ",hello" + count);
                if (count >= FiberNumber) {
                    System.out.println("done");
                    return;
                }
                System.out.println(Thread.currentThread().getName() + ",over" + count + ",sleep:" + rst);
            }).start();
        }
        Thread.sleep(30000);
    }
}
