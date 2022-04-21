package com.bibabo.thread.juc;

import java.util.Random;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 15:26
 * @description
 */
public class BlockingQueueTest {


    public static void main(String[] args) throws InterruptedException {
        BlockingQueue<String> blockingQueue = new LinkedBlockingQueue<>();

        new Thread(new BlockingQueueRunnable<>(blockingQueue)).start();
        new Thread(new BlockingQueueRunnable<>(blockingQueue)).start();
        new Thread(new BlockingQueueRunnable<>(blockingQueue)).start();
        new Thread(new BlockingQueueRunnable<>(blockingQueue)).start();

        String element = blockingQueue.take();
        System.out.println("主线程消费消息" + element);
    }

    static class BlockingQueueRunnable<T> implements Runnable {

        BlockingQueue<T> blockingQueue;

        public BlockingQueueRunnable(BlockingQueue<T> blockingQueue) {
            this.blockingQueue = blockingQueue;
        }

        @Override
        public void run() {
            try {
                TimeUnit.SECONDS.sleep(new Random().nextInt(10));
                System.out.println("我是线程" + Thread.currentThread().getName());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            blockingQueue.add((T) ("我是线程" + Thread.currentThread().getName() + "已经执行完毕"));
        }
    }

}
