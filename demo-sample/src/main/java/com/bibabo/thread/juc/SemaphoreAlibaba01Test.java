package com.bibabo.thread.juc;

import java.util.Random;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 14:08
 * @description 多个排序算法并行执行，返回第一个执行完毕的结果
 */
public class SemaphoreAlibaba01Test {

    public static void main(String[] args) throws InterruptedException {

        Semaphore semaphore = new Semaphore(0);// 没有位置

        for (int i = 0;i < 8; i ++) {
            new Thread(new SemaphoreRunnable(semaphore)).start();
        }
        semaphore.acquire();
        System.out.println("主线程已得到结果 执行结束");
    }

    static class SemaphoreRunnable implements Runnable {

        Semaphore semaphore;

        public SemaphoreRunnable(Semaphore semaphore) {
            this.semaphore = semaphore;
        }

        @Override
        public void run() {

            try {
                System.out.println("线程" + Thread.currentThread().getName() + "获取令牌 正在执行");
                TimeUnit.SECONDS.sleep(new Random().nextInt(10));
                semaphore.release(1);// 默认释放1
                System.out.println("线程" + Thread.currentThread().getName() + "释放令牌 执行结束");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

}
