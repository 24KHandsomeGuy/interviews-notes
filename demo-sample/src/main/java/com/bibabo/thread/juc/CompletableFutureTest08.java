package com.bibabo.thread.juc;

import java.io.IOException;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 18:05
 * @description CompletableFuture
 * 多线程 异步并行计算
 */
public class CompletableFutureTest08 {

    public static void main(String[] args) throws ExecutionException, InterruptedException, IOException {

        // 1先完成，stack=OrRelay，tryfire，返回的是12，12的stack=OrRelay，OrRelay.next=UiAccept，先执行UiAccept，再执行OrRelay，tryfire，返回的是123，stack=UiAccept，直接执行。最后执行1的UiAccept

        CompletableFuture<Double> completableFuture1 = CompletableFuture.supplyAsync(() -> 1.1);
        completableFuture1.thenAccept(result -> System.out.println("1打印:" + result));

        CompletableFuture<Double> completableFuture2 = CompletableFuture.supplyAsync(() -> {
            try {
                TimeUnit.SECONDS.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return 2.2;
        });
        completableFuture2.thenAccept(result -> System.out.println("2打印:" + result));

        CompletableFuture<Object> completableFuture12 = CompletableFuture.anyOf(completableFuture1, completableFuture2);
        completableFuture12.thenAccept(result -> System.out.println("12打印：" + result));

        CompletableFuture<Double> completableFuture3 = CompletableFuture.supplyAsync(() -> {
            try {
                TimeUnit.SECONDS.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return 3.3;
        });

        CompletableFuture<Object> completableFuture123 = CompletableFuture.anyOf(completableFuture12, completableFuture3);
        completableFuture123.thenAccept(result -> System.out.println("123打印:" + result));

        System.in.read();
    }

}
