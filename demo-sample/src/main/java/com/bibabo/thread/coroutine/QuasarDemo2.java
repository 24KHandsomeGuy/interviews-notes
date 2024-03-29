package com.bibabo.thread.coroutine;

import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.strands.Strand;

import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/2 17:57
 * @Description:
 * QUASAR WARNING: Quasar Java Agent isn't running. If you're using another instrumentation method you can ignore this message; otherwise, please refer to the Getting Started section in the Quasar documentation.
 * 配置jvm参数：-javaagent:D:\AboutIT\GuPao\repository\co\paralleluniverse\quasar-core\0.7.6\quasar-core-0.7.6.jar
 */
public class QuasarDemo2 {

    public static void main(String[] args) throws InterruptedException {

        int FiberNumber = 10;

        // CountDownLatch latch = new CountDownLatch(1);

        AtomicInteger counter = new AtomicInteger(0);

        for (int i = 0; i < FiberNumber; i++) {
            new Fiber(() -> {
                int count = counter.getAndIncrement();
                System.out.println(Thread.currentThread().getName() + ",hello" + count);
                if (count == FiberNumber) {
                    System.out.println("done");
                }
                // 会报错
                // Thread.sleep(20000);
                int rst = new Random().nextInt(10000);
                Strand.sleep(rst);
                System.out.println(Thread.currentThread().getName() + ",over" + count + ",sleep:" + rst);
            }).start();
        }
        Thread.sleep(30000);
    }
}
