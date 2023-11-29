package com.bibabo.thread.juc;

import java.util.Random;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 14:08
 * @description
 */
public class SemaphoreTest {

    public static void main(String[] args) {

        Semaphore semaphore = new Semaphore(3, true);

        for (int i = 0;i < 8; i ++) {
            new Thread(new SemaphoreRunnable(semaphore)).start();
        }

    }

    static class SemaphoreRunnable implements Runnable {

        Semaphore semaphore;

        public SemaphoreRunnable(Semaphore semaphore) {
            this.semaphore = semaphore;
        }

        @Override
        public void run() {
            try {
                semaphore.acquire();
                System.out.println("线程" + Thread.currentThread().getName() + "获取令牌 正在执行");
                TimeUnit.SECONDS.sleep(new Random().nextInt(50));
                semaphore.release();// 默认释放1
                System.out.println("线程" + Thread.currentThread().getName() + "释放令牌 执行结束");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

}
