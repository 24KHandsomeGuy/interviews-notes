package com.bibabo.thread;

import java.util.Random;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.function.Supplier;

/**
 * @author fukuixiang
 * @date 2021/1/21
 * @time 10:19
 * @description 并发查询demo
 */
public class ConcurrentQueryDemo3 {

    public static void main(String[] args) throws InterruptedException, ExecutionException {

        CompletableFuture<String> completableFuture1 = CompletableFuture.supplyAsync(new ConcurrentQuerySupplier("id=1"));
        CompletableFuture<String> completableFuture2 = CompletableFuture.supplyAsync(new ConcurrentQuerySupplier("id=2"));
        CompletableFuture<String> completableFuture3 = CompletableFuture.supplyAsync(new ConcurrentQuerySupplier("id=3"));

        System.out.println("主线程 执行结束 s1:" + completableFuture1.get() + "---s2:" + completableFuture2.get() + "---s3:" + completableFuture3.get());
    }

    static class ConcurrentQuerySupplier implements Supplier<String> {
        private String queryParam;
        public ConcurrentQuerySupplier(String queryParam) {
            this.queryParam = queryParam;
        }

        @Override
        public String get() {
            System.out.println("线程" + Thread.currentThread().getName() + "正在查询。参数：" + queryParam);
            try {
                TimeUnit.SECONDS.sleep(new Random().nextInt(20));
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "结果为：" + Thread.currentThread().getName();
        }
    }

}
