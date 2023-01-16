package com.bibabo.thread.lockQueue;

import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/15
 * @time 11:13
 * @description 是有问题的
 */
@Deprecated
public class ProducerConsumer {

    static volatile boolean stopFlag = false;

    public static void main(String[] args) throws InterruptedException {

        MyBlockingQueue<String> blockingQueue = new MyBlockingQueue<>();

        new Thread(() -> {
            int num = 0;
            while (!stopFlag) {
                try {
                    TimeUnit.SECONDS.sleep(5);
                    blockingQueue.add("hello" + num ++);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();

        new Thread(() -> {
            while (!stopFlag) {
                System.out.println("消费者消费：" + blockingQueue.take());
            }
        }).start();

    }

}
