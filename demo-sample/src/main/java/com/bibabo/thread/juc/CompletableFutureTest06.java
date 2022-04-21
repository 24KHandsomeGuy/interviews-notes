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
public class CompletableFutureTest06 {

    public static void main(String[] args) throws ExecutionException, InterruptedException, IOException {

        CompletableFuture.completedFuture(2.0).thenApply(result -> result + 1.2).thenAccept(result -> System.out.println(result));

    }

}
