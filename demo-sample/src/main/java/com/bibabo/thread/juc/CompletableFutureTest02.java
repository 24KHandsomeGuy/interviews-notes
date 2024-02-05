package com.bibabo.thread.juc;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 18:05
 * @description CompletableFuture
 * 多线程 异步串行计算
 */
public class CompletableFutureTest02 {

    public static void main(String[] args) {

        ThreadPoolExecutor executor = new ThreadPoolExecutor(4, 8, 10, TimeUnit.SECONDS, new LinkedBlockingQueue<>(50));

        Object o = new Object();

        CompletableFuture.supplyAsync(
                        () -> {
                            System.out.println("线程" + Thread.currentThread().getName() + "正在执行查询1，参数：" + o.toString());
                            return "hello";
                        }
                        , executor)
                .thenApplyAsync(result1 -> {
                    System.out.println("线程" + Thread.currentThread().getName() + "正在执行查询2");
                    return result1 + ",word";
                }, executor)// 获取到的结果要接收使用 这里是consumer
                .thenApplyAsync(result2 -> {
                    System.out.println("线程" + Thread.currentThread().getName() + "正在执行查询3");
                    return result2 + "---fukuixiang ";
                }, executor)// 获取到的结果要接收使用 这里是consumer
                .thenAcceptAsync(result -> System.out.println("最终结果为" + result), executor)
                .exceptionally(ex -> {
                    ex.getMessage();
                    return null;
                })
        //.join()
        ;

        executor.shutdown();
    }

}
