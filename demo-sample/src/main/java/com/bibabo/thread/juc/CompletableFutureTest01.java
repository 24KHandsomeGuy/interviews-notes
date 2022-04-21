package com.bibabo.thread.juc;

import com.bibabo.thread.ConcurrentQueryDemo;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 18:05
 * @description CompletableFuture
 * xxx      使用当前线程执行
 * xxxAsync 重新开启新线程执行
 * 带返回值的线程执行完毕后，把结果给到consumer消费
 */
public class CompletableFutureTest01 {

    public static void main(String[] args) {

        ThreadPoolExecutor executor = new ThreadPoolExecutor(4, 8, 10, TimeUnit.SECONDS, new LinkedBlockingQueue<>(50));

        Object o = new Object();

        CompletableFuture.supplyAsync(
                () -> {System.out.println("线程" + Thread.currentThread().getName() + "正在执行查询，参数：" + o.toString());return Thread.currentThread().getName() + "开启多线程查询结果为100";}
                , executor)
                .thenAccept(result1 -> System.out.println("线程" + Thread.currentThread().getName() + "正在处理查询结果" + result1))// 获取到的结果要接收使用 这里是consumer
                .exceptionally(ex -> {ex.getMessage();return null;})
                //.join()
                ;
        CompletableFuture.runAsync(new ConcurrentQueryDemo.ConcurrentQueryPocessor(new CountDownLatch(1)));
        executor.shutdown();

    }

}
