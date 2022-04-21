package com.bibabo.thread.test;

import lombok.SneakyThrows;

import java.util.Random;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/4/20
 * @time 16:40
 * @description
 */
public class Test4 {

    @SneakyThrows
    public static void main(String[] args) {
        ThreadA<Integer> threadA = new ThreadA<Integer>(new CallableA());
        new Thread(threadA).start();
        System.out.println(threadA.getResult());
    }

    public static class ThreadA<T> implements Runnable {

        Callable<T> callable;

        T result;

        public ThreadA(Callable<T> callable) {
            this.callable = callable;
        }

        @SneakyThrows
        @Override
        public void run() {
            TimeUnit.SECONDS.sleep(1);
            this.result = callable.call();
        }

        @SneakyThrows
        private T getResult() {
            for ( ; ; ) { // 自旋阻塞
                if (result != null) {
                    return result;
                }
                System.out.println("阻塞拿值失败，重试");
                Thread.sleep(100);
            }
        }
    }

    public static class CallableA implements Callable<Integer> {

        @Override
        public Integer call() throws Exception {
            return new Random().nextInt(100000);
        }
    }

}
