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
public class Demo {

    public static void main(String[] args) throws ExecutionException, InterruptedException {
        ParWorker w = new ParWorker();
        ParWorker1 w1 = new ParWorker1();
        ParWorker2 w2 = new ParWorker2();

        WorkerWrapper<Integer, Long> workerWrapper2 = new WorkerWrapper.Builder<Integer, Long>()
                .worker(w2)
                .callback(w2)
                .param(2)
                .build();

        WorkerWrapper<Integer, Long> workerWrapper1 = new WorkerWrapper.Builder<Integer, Long>()
                .worker(w1)
                .callback(w1)
                .param(1)
                .build();

        WorkerWrapper<Integer, Long> workerWrapper = new WorkerWrapper.Builder<Integer, Long>()
                .worker(w)
                .callback(w)
                .param(0)
                //.next(workerWrapper1, workerWrapper2)
                .depend(workerWrapper1, workerWrapper2)
                .build();

        long now = SystemClock.now();

        Async.beginWork(3000, workerWrapper1, workerWrapper2);
//        Async.beginWork(800, workerWrapper, workerWrapper1, workerWrapper2);
//        Async.beginWork(1000, workerWrapper, workerWrapper1, workerWrapper2);

        System.err.println("cost-" + (SystemClock.now() - now) + "线程：" + Thread.currentThread().getName() + "线程数：" + Async.getThreadCount());

        System.err.println("result:" + workerWrapper.getWorkResult().getResult());
        System.err.println("result:" + workerWrapper1.getWorkResult().getResult());
        System.err.println("result:" + workerWrapper2.getWorkResult().getResult());
        Async.shutDown();
    }
}
