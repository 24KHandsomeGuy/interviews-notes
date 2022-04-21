package com.bibabo.thread.juc;

import java.io.IOException;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 18:05
 * @description CompletableFuture
 * xxx      使用当前线程执行
 * xxxAsync 重新开启新线程执行
 * 带返回值的线程执行完毕后，把结果给到consumer消费
 */
public class CompletableFutureTest07 {

    public static void main(String[] args) throws ExecutionException, InterruptedException, IOException {

        CompletableFuture<Double> future = CompletableFuture.supplyAsync(() -> 2.0)
                .thenCompose(result -> CompletableFuture.supplyAsync(() -> {
                    System.out.println("future2打印1的结果为" + result);
                    return result + 1.5;
                })).thenCompose(result -> CompletableFuture.supplyAsync(() -> {
                    System.out.println("future3打印2的结果为" + result);
                    return result + 4.7;
                }));

        System.out.println("主线程打印最终结果为：" + future.get());
    }

}
