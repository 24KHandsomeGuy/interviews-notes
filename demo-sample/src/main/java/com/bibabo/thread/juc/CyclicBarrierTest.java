package com.bibabo.thread.juc;

import java.util.Vector;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 10:56
 * @description 多个查询一起去并行查询，最后一个command线程去处理查询后的结果集
 */
public class CyclicBarrierTest {

    public static void main(String[] args) {

        int parties = 3;

        Vector<String> results = new Vector<>();
        Thread commandThread = new Thread(new CommandRunnable(results));

        CyclicBarrier cyclicBarrier = new CyclicBarrier(parties, commandThread);

        new Thread(new QueryRunnable(cyclicBarrier, results)).start();
        new Thread(new QueryRunnable(cyclicBarrier, results)).start();
        new Thread(new QueryRunnable(cyclicBarrier, results)).start();
        new Thread(new QueryRunnable(cyclicBarrier, results)).start();
        new Thread(new QueryRunnable(cyclicBarrier, results)).start();
        new Thread(new QueryRunnable(cyclicBarrier, results)).start();

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
                TimeUnit.SECONDS.sleep(5);
                System.out.println("结果" + Thread.currentThread().getName());
                results.add("结果" + Thread.currentThread().getName());
                cyclicBarrier.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (BrokenBarrierException e) {
                e.printStackTrace();
            }

        }
    }

    static class CommandRunnable implements Runnable {

        Vector<String> results;

        public CommandRunnable(Vector<String> results) {
            this.results = results;
        }

        @Override
        public void run() {
            System.out.println("拿到结果集处理" + results.toString());
        }
    }


}
