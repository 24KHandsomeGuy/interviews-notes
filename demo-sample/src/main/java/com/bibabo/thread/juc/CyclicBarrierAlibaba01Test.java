package com.bibabo.thread.juc;

import java.util.Random;
import java.util.Vector;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 10:56
 * @description 多个排序算法并行执行，返回第一个执行完毕的结果
 * CyclicBarrier无法完全满足这种场景，如果排序算法个数也就是线程数是偶数 是可以的，但如果是奇数，那么终将有一个线程会被一直阻塞，更糟糕的情况是被阻塞的是主线程
 */
public class CyclicBarrierAlibaba01Test {

    public static void main(String[] args) throws BrokenBarrierException, InterruptedException {

        int parties = 2;

        Vector<String> results = new Vector<>();
        results.add("1");
        results.add("3");
        results.add("2");
        results.add("6");

        CyclicBarrier cyclicBarrier = new CyclicBarrier(parties);

        new Thread(new QueryRunnable(cyclicBarrier, results)).start();
        new Thread(new QueryRunnable(cyclicBarrier, results)).start();

        Thread.sleep(10000);
        cyclicBarrier.await();

    }

    static class QueryRunnable implements Runnable {

        CyclicBarrier cyclicBarrier;

        Vector<String> results;

        public QueryRunnable(CyclicBarrier cyclicBarrier, Vector<String> results) {
            this.cyclicBarrier = cyclicBarrier;
            this.results = results;
        }

        @Override
        public void run() {
            try {
                Random random = new Random();
                TimeUnit.SECONDS.sleep(random.nextInt(10));
                System.out.println("排序：" + Thread.currentThread().getName());
                cyclicBarrier.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (BrokenBarrierException e) {
                e.printStackTrace();
            }

        }
    }

}
