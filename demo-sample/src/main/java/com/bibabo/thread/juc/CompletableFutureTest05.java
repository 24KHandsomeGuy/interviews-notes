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
public class CompletableFutureTest05 {

    public static void main(String[] args) throws ExecutionException, InterruptedException, IOException {


        /*// supplyAsync
        CompletableFuture<String> completableFuture = CompletableFuture.supplyAsync(() -> {int i = 10;i ++; return i + "";});
        System.out.println(completableFuture.get());*/

        /*// runAsync
        CompletableFuture<Void> completableFuture = CompletableFuture.runAsync(() -> System.out.println("测试"));
        System.out.println(completableFuture.get());*/

        // 看源码
        CompletableFuture<String> completableFuture1 = CompletableFuture.supplyAsync(() -> {
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            int i = 10;i ++; return i + "";
            });
        // 异步线程执行结束后 以栈的形式调用
        /*completableFuture1.thenAcceptAsync(s -> System.out.println(s + "2222"));
        completableFuture1.thenAcceptAsync(s -> System.out.println(s + "3333"));
        completableFuture1.thenAcceptAsync(s -> System.out.println(s + "4444"));*/
        completableFuture1.thenAccept(s -> System.out.println(s + "2222"));
        completableFuture1.thenAccept(s -> System.out.println(s + "3333"));
        completableFuture1.thenAccept(s -> System.out.println(s + "4444"));
        System.out.println(completableFuture1.get());

        /*// anyOf
        CompletableFuture<String> completableFuture1 = CompletableFuture.supplyAsync(() -> "测试1");
        CompletableFuture<String> completableFuture2 = CompletableFuture.supplyAsync(() -> "测试2");
        CompletableFuture<Object> completableFuture = CompletableFuture.anyOf(completableFuture1, completableFuture2);
        completableFuture.thenAccept(s -> System.out.println(s));
        System.out.println("主线程" + completableFuture.get());*/

        // allOf
        /*CompletableFuture<String> completableFuture1 = CompletableFuture.supplyAsync(() -> "测试1");
        CompletableFuture<String> completableFuture2 = CompletableFuture.supplyAsync(() -> "测试2");
        CompletableFuture<Void> completableFuture = CompletableFuture.allOf(completableFuture1, completableFuture2);
        completableFuture.thenAccept(s -> System.out.println(s));
        System.out.println("主线程" + completableFuture.get())*/;

        //System.in.read();

    }

}
