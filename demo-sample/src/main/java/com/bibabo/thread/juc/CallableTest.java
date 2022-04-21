package com.bibabo.thread.juc;

import java.util.Random;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 19:24
 * @description
 */
public class CallableTest {

    public static void main(String[] args) throws ExecutionException, InterruptedException {

        FutureTask<String> futureTask = new FutureTask<>(new CallableDemo());
        new Thread(() -> {
            try {
                TimeUnit.SECONDS.sleep(new Random().nextInt(10));
                futureTask.run();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();
        String result = futureTask.get();

        System.out.println(result);
    }

    static class CallableDemo implements Callable<String> {

        @Override
        public String call() throws Exception {
            return "hello word";
        }
    }

}
