package com.bibabo.thread.juc;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 19:24
 * @description
 */
public class CallableTest02 {

    public static void main(String[] args) throws ExecutionException, InterruptedException {

        ExecutorService executor = Executors.newSingleThreadExecutor();
        Future<String> future = executor.submit(new CallableDemo());

        String result = future.get();

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
