package com.bibabo.jd.asyncTool;

import com.jd.platform.async.executor.Async;
import com.jd.platform.async.executor.timer.SystemClock;
import com.jd.platform.async.wrapper.WorkerWrapper;

import java.util.concurrent.ExecutionException;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/2/1 15:45
 * @Description
 */
public class DemoComplex {

    public static void main(String[] args) throws ExecutionException, InterruptedException {
        /**
         * A -> C -> D
         * B -> C -> E
         */

        ParWorker w = new ParWorker();
        ParWorker1 w1 = new ParWorker1();
        ParWorker2 w2 = new ParWorker2();
        ParWorker3 w3 = new ParWorker3();
        ParWorker4 w4 = new ParWorker4();
        ParWorker5 w5 = new ParWorker5();

        WorkerWrapper<Integer, Long> workerWrapperA = new WorkerWrapper.Builder<Integer, Long>()
                .worker(w1)
                .callback(w1)
                .param(1)
                .build();

        WorkerWrapper<Integer, Long> workerWrapperB = new WorkerWrapper.Builder<Integer, Long>()
                .worker(w2)
                .callback(w2)
                .param(2)
                .build();

        WorkerWrapper<Integer, Long> workerWrapperC = new WorkerWrapper.Builder<Integer, Long>()
                .worker(w3)
                .callback(w3)
                .param(3)
                .depend(workerWrapperA, workerWrapperB)
                // 4、5串行了
                // .next(workerWrapperD, workerWrapperE)
                .build();

        WorkerWrapper<Integer, Long> workerWrapperD = new WorkerWrapper.Builder<Integer, Long>()
                .worker(w4)
                .callback(w4)
                .param(4)
                // 4、5并行了
                .depend(workerWrapperC)
                .build();

        WorkerWrapper<Integer, Long> workerWrapperE = new WorkerWrapper.Builder<Integer, Long>()
                .worker(w5)
                .callback(w5)
                // 4、5并行了
                .depend(workerWrapperC)
                .param(5)
                .build();



        long now = SystemClock.now();

        Async.beginWork(300, workerWrapperA, workerWrapperB);
//        Async.beginWork(800, workerWrapper, workerWrapper1, workerWrapper2);
//        Async.beginWork(1000, workerWrapper, workerWrapper1, workerWrapper2);

        System.err.println("cost-" + (SystemClock.now() - now) + "线程：" + Thread.currentThread().getName() + "线程数：" + Async.getThreadCount());

        System.err.println("result:" + workerWrapperA.getWorkResult().getResult());
        System.err.println("result:" + workerWrapperB.getWorkResult().getResult());
        System.err.println("result:" + workerWrapperC.getWorkResult().getResult());
        System.err.println("result:" + workerWrapperD.getWorkResult().getResult());
        System.err.println("result:" + workerWrapperE.getWorkResult().getResult());
        Async.shutDown();
    }
}
