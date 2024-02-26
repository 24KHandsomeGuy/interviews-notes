package com.bibabo.thread.juc;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.*;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 18:05
 * @description CompletableFuture
 * 多线程 异步并行计算
 */
public class CompletableFutureTest04 {

    public static void main(String[] args) throws ExecutionException, InterruptedException, TimeoutException {

        ThreadPoolExecutor executor = new ThreadPoolExecutor(4, 8, 10, TimeUnit.SECONDS, new LinkedBlockingQueue<>(50));

        Object o = new Object();

        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(5);
        list.add(0);

        CompletableFuture<String> completableFuture1 = CompletableFuture.supplyAsync(() -> {
            try {
                // TimeUnit.SECONDS.sleep(new Random().nextInt(5));
                TimeUnit.SECONDS.sleep(4);
                System.out.println("算法11对" + list + "进行排序");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "排序算法1已执行完毕";
        }, executor);

        CompletableFuture<String> completableFuture2 = CompletableFuture.supplyAsync(() -> {
            try {
                // TimeUnit.SECONDS.sleep(new Random().nextInt(20));
                TimeUnit.SECONDS.sleep(10);
                System.out.println("算法22对" + list + "进行排序");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "排序算法2已执行完毕";
        }, executor).whenComplete((result, throwable) -> {
            System.out.println("子线程:" + result);
        });

        CompletableFuture<Void> completableFuture = CompletableFuture.allOf(completableFuture1, completableFuture2)
                .whenComplete((result, throwable) -> {
                    System.out.println("主线程asdasd:" + result);
                })
                .thenAccept(result -> System.out.println("主线程已经拿到最快排序算法的执行完毕的响应 ---- " + result))
                ;

        System.out.println("主线程前置打印");
        try {
            // System.out.println("主线程：" + completableFuture.get(20, TimeUnit.SECONDS));
            System.out.println("主线程：" + completableFuture.join());
        } catch (Exception e) {
            System.out.println(e);
        }
        /*System.out.println("主线程等子1：" + completableFuture1.get(5, TimeUnit.SECONDS));
        System.out.println("主线程等子2：" + completableFuture2.get(8, TimeUnit.SECONDS));*/

        executor.shutdown();
    }

}
