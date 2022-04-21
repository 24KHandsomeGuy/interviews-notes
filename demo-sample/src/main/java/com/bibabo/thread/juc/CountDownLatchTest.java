package com.bibabo.thread.juc;

import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/2/4
 * @time 11:44
 * @description
 */
public class CountDownLatchTest {

    public static void main(String[] args) throws InterruptedException {

        CountDownLatch countDownLatch = new CountDownLatch(3);

        new Thread(new CountDownLatchRunnable(countDownLatch)).start();
        new Thread(new CountDownLatchRunnable(countDownLatch)).start();
        new Thread(new CountDownLatchRunnable(countDownLatch)).start();
        new Thread(new CountDownLatchRunnable(countDownLatch)).start();

        countDownLatch.await();
    }


    static class CountDownLatchRunnable implements Runnable {

        CountDownLatch countDownLatch;

        public CountDownLatchRunnable(CountDownLatch countDownLatch) {
            this.countDownLatch = countDownLatch;
        }

        @Override
        public void run() {
            System.out.println(Thread.currentThread().getName() + "正在处理算法");
            try {
                TimeUnit.SECONDS.sleep(new Random().nextInt(10));
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            countDownLatch.countDown();
            System.out.println(Thread.currentThread().getName() + "处理算法结束");
        }
    }

}
