package com.bibabo.thread.juc;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 18:05
 * @description CompletableFuture
 * 多线程 异步并行计算
 */
public class CompletableFutureTest04 {

    public static void main(String[] args) throws ExecutionException, InterruptedException {

        ThreadPoolExecutor executor = new ThreadPoolExecutor(4, 8, 10, TimeUnit.SECONDS, new LinkedBlockingQueue<>(50));

        Object o = new Object();

        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(5);
        list.add(0);

        CompletableFuture<String> completableFuture1 = CompletableFuture.supplyAsync(() -> {
            try {
                TimeUnit.SECONDS.sleep(new Random().nextInt(5));
                System.out.println("算法11对" + list + "进行排序");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "排序算法1已执行完毕";
        }, executor);

        CompletableFuture<String> completableFuture2 = CompletableFuture.supplyAsync(() -> {
            try {
                TimeUnit.SECONDS.sleep(new Random().nextInt(5));
                System.out.println("算法22对" + list + "进行排序");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "排序算法2已执行完毕";
        }, executor);

        CompletableFuture<Void> completableFuture = CompletableFuture.allOf(completableFuture1, completableFuture2)
                //.thenAccept(result -> System.out.println("主线程已经拿到最快排序算法的执行完毕的响应 ---- " + result))
                ;

        System.out.println("主线程" + completableFuture1.get());
        System.out.println("主线程" + completableFuture2.get());

        executor.shutdown();
    }

}
