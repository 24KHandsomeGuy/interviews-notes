package com.bibabo.thread;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * @author fukuixiang
 * @date 2021/3/11
 * @time 14:39
 * @description
 */
public class ThreadPrint2 {

    public static void main(String[] args) throws InterruptedException {
        // 三个线程 循环打印 123 456 789 到75
        // 必须要有一个循环链来控制线程的打印
        // 使用condition做控制
        BlockingQueue<List<Integer>> blockingQueue1 = new LinkedBlockingQueue<>();
        BlockingQueue<List<Integer>> blockingQueue2 = new LinkedBlockingQueue<>();
        BlockingQueue<List<Integer>> blockingQueue3 = new LinkedBlockingQueue<>();
        new Thread(new MyRunnable(blockingQueue1, blockingQueue2, 3)).start();
        new Thread(new MyRunnable(blockingQueue2, blockingQueue3,3 )).start();
        new Thread(new MyRunnable(blockingQueue3, blockingQueue1, 3)).start();

        blockingQueue1.add(Arrays.asList(1,2,3));

    }


    static class MyRunnable implements Runnable {

        BlockingQueue<List<Integer>> blockingQueue;
        BlockingQueue<List<Integer>> nextBlockingQueue;
        int thresold;

        public MyRunnable(BlockingQueue<List<Integer>> blockingQueue, BlockingQueue<List<Integer>> nextBlockingQueue, int thresold) {
            this.blockingQueue = blockingQueue;
            this.nextBlockingQueue = nextBlockingQueue;
            this.thresold = thresold;
        }

        @Override
        public void run() {

            while (true) {

                try {
                    List<Integer> list = blockingQueue.take();
                    List<Integer> nextList = new ArrayList<>(thresold);
                    for (Integer integer : list) {
                        if (integer > 75) {
                            nextList.add(integer);
                            nextBlockingQueue.add(nextList);
                            return;
                        }
                        System.out.println(integer);
                        nextList.add(integer + thresold);
                    }
                    nextBlockingQueue.add(nextList);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

            }
        }
    }

}
