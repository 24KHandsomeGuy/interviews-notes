package com.bibabo.thread.coroutine;

import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.fibers.SuspendExecution;
import co.paralleluniverse.fibers.Suspendable;
import co.paralleluniverse.strands.Strand;
import co.paralleluniverse.strands.SuspendableRunnable;

import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.LongAdder;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/7 15:52
 * @Description:
 */
public class ThreadComparesWithCoroutine {

    @Suspendable
    static void m1() throws InterruptedException, SuspendExecution {
        m2();
    }

    static String m2() throws SuspendExecution, InterruptedException {
        String m = m3();
        Strand.sleep(1000);
        return m;
    }

    //or define in META-INF/suspendables
    @Suspendable
    static String m3() {
        List l = Stream.of(1, 2, 3).filter(i -> i % 2 == 0).collect(Collectors.toList());
        return l.toString();
    }

    static public void main(String[] args) throws InterruptedException {
        int count = 10000;
        /**
         * 1.if ThreadPool fixed size is 20
         * test result: 500s 8min
         * 2.if ThreadPool fixed size is 200
         * test result: thread pool took: 50719ms, latency: 1009 ms
         * 3.if ThreadPool fixed size is 500
         * test result: thread pool took: 20588ms, latency: 1010 ms
         * 4.if ThreadPool fixed size is 2000
         * test result: thread pool took: 6134ms, latency: 1075 ms.
         * context switch spends 1s.
         * 5.if ThreadPool fixed size is 10000
         * test result: thread pool took: 91196ms, latency: 90430 ms
         * we except the result to be 1s, but the result has a huge gap with our expectations.
         * so many threads had been created, when 1 second is over, ten thousand threads had scrambled the CPU resources,
         * context switch again and again.
         */
        testThreadpool(count);
        // fiber took: 1513ms, latency: 1004 ms
        testFiber(count);
    }

    static void testThreadpool(int count) throws InterruptedException {
        final CountDownLatch latch = new CountDownLatch(count);
        ExecutorService es = Executors.newFixedThreadPool(200);
        LongAdder latency = new LongAdder();
        long t = System.currentTimeMillis();
        for (int i = 0; i < count; i++) {
            es.submit(() -> {
                long start = System.currentTimeMillis();
                try {
                    m1();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } catch (SuspendExecution suspendExecution) {
                    suspendExecution.printStackTrace();
                }
                start = System.currentTimeMillis() - start;
                latency.add(start);
                latch.countDown();
            });
        }
        latch.await();
        t = System.currentTimeMillis() - t;
        long l = latency.longValue() / count;
        System.out.println("thread pool took: " + t + ", latency: " + l + " ms");
        es.shutdownNow();
    }

    static void testFiber(int count) throws InterruptedException {
        final CountDownLatch latch = new CountDownLatch(count);
        LongAdder latency = new LongAdder();
        long t = System.currentTimeMillis();
        for (int i = 0; i < count; i++) {
            new Fiber<Void>("Caller", new SuspendableRunnable() {
                @Override
                public void run() throws SuspendExecution, InterruptedException {
                    long start = System.currentTimeMillis();
                    m1();
                    start = System.currentTimeMillis() - start;
                    latency.add(start);
                    latch.countDown();
                }
            }).start();
        }
        latch.await();
        t = System.currentTimeMillis() - t;
        long l = latency.longValue() / count;
        System.out.println("fiber took: " + t + ", latency: " + l + " ms");
    }

}
