package com.bibabo.thread.juc;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 19:24
 * @description
 */
public class CallableTest03 {

    public static void main(String[] args) throws ExecutionException, InterruptedException {

        ExecutorService executor = Executors.newSingleThreadExecutor();
        FutureTask<String> futureTask = new FutureTask<>(new CallableDemo());
        executor.submit(futureTask);// 返回的类型也是FutureTask 所以怎么写都行

        String result = futureTask.get();

        System.out.println(result);
        executor.shutdown();
    }

    static class CallableDemo implements Callable<String> {

        @Override
        public String call() throws Exception {
            return "hello word";
        }
    }

}
