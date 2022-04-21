package com.bibabo.thread.juc;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.ForkJoinTask;
import java.util.concurrent.RecursiveAction;
import java.util.concurrent.RecursiveTask;

/**
 * @author fukuixiang
 * @date 2021/3/10
 * @time 16:36
 * @description
 */
public class ForkJoinTest {

    public static void main(String[] args) throws ExecutionException, InterruptedException {

        // 这种new的方式dog lea是不推荐的
        // ForkJoinPool forkJoinPool = new ForkJoinPool();
        // 这种方式是推荐的 因为common返回的ForkJoinPool是static 进程共享的
        // CompletableFuture默认使用的也是这个common线程池，并行流计算使用的也是这个线程池
        ForkJoinPool forkJoinPool = ForkJoinPool.commonPool();
        // invoke(ForkJoinTask t)	提交任务并一直阻塞直到任务执行完成返回合并结果
        // execute(ForkJoinTask t)	异步执行任务，无返回值
        // submit(ForkJoinTask t)	异步执行任务，返回task本身，可以通过task.get()方法获取合并之后的结果


        MyForkJoinTask myForkJoinTask = new MyForkJoinTask(1, 100000000, 20000);
        forkJoinPool.submit(myForkJoinTask);

        System.out.println(myForkJoinTask.get());

    }

    // 带返回值的
    static class MyForkJoinTask extends RecursiveTask<Integer> {

        int start;
        int end;
        int threshold;

        public MyForkJoinTask(int start, int end, int threshold) {
            this.start = start;
            this.end = end;
            this.threshold = threshold;
        }

        @Override
        protected Integer compute() {
            int sum = 0;

            if ((end - start) <= threshold) {// 直接执行
                for (int i = (end - start);i > 0; i --) {
                    sum += i;
                }
            } else {// 分而治之
                int middle = (start + end) / 2;
                MyForkJoinTask leftTask = new MyForkJoinTask(start, middle, threshold);
                MyForkJoinTask rightTask = new MyForkJoinTask(middle - 1, end, threshold);
                ForkJoinTask<Integer> leftForkJoinTask = leftTask.fork();
                ForkJoinTask<Integer> rightForkJoinTask = rightTask.fork();

                Integer leftResult = leftForkJoinTask.join();
                Integer rightResult = rightForkJoinTask.join();

                sum += leftResult + rightResult;
            }


            return sum;
        }
    }

    // 不带返回值的
    static class MyForkJoinAction extends RecursiveAction {

        @Override
        protected void compute() {

        }
    }

}
