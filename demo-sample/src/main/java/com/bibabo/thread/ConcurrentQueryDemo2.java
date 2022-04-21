package com.bibabo.thread;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.BlockingDeque;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/1/21
 * @time 10:19
 * @description 并发查询demo
 */
public class ConcurrentQueryDemo2 {

    public static void main(String[] args) throws InterruptedException, ExecutionException {

        int coreThreadSize = 3;// 核心线程数
        int maxThreadSize = 3;// 最大线程数
        int keepAliveTime = 1000;// 最大线程存活时间
        BlockingDeque blockingDeque = new LinkedBlockingDeque();// 阻塞队列，超过核心线程数的任务 放入到阻塞队列等待

        ThreadPoolExecutor executor = new ThreadPoolExecutor(coreThreadSize, maxThreadSize,keepAliveTime , TimeUnit.MILLISECONDS, blockingDeque);

        ConcurrentQueryPocessor processor1 = new ConcurrentQueryPocessor("查询1");
        Future<List<String>> future1 = executor.submit(processor1);

        ConcurrentQueryPocessor processor2 = new ConcurrentQueryPocessor("查询2");
        Future<List<String>> future2 = executor.submit(processor2);

        ConcurrentQueryPocessor processor3 = new ConcurrentQueryPocessor("查询3");
        Future<List<String>> future3 = executor.submit(processor3);

        // 此处阻塞等待结果
        List<String> s1 = future1.get();
        List<String> s2 = future2.get();
        List<String> s3 = future3.get();

        System.out.println("主线程 执行结束 s1:" + s1 + "---s2:" + s2 + "---s3:" + s3);
        executor.shutdown();
    }

    public static class ConcurrentQueryPocessor implements Callable<List<String>> {

        private String queryName;

        private String queryParam;

        public ConcurrentQueryPocessor(String queryName) {
            this.queryName = queryName;
        }

        @Override
        public List<String> call() throws Exception {
            // 查询
            System.out.println("线程名称:" + Thread.currentThread().getName() + "正在查询...");
            List result = new ArrayList();
            try {
                Thread.sleep(2000);// 模拟查询2s中
                result.add("" + new Random().nextInt());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            
            return result;
        }
    }

}
