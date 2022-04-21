package com.bibabo.thread.juc;

import java.util.Random;
import java.util.concurrent.Exchanger;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 14:47
 * @description 多个排序算法并行执行，返回第一个执行完毕的结果
 * 和CyclicBarrier一样 算上主线程 如果是偶数不会有问题 如果是奇数那么肯定会有一个线程无法与其他线程交换数据 导致一直阻塞
 */
public class ExchangerAlibaba01Test {

    public static void main(String[] args) throws InterruptedException {

        Exchanger<String> exchanger = new Exchanger<>();

        new Thread(new ExchangerRunnable<>(exchanger)).start();
        new Thread(new ExchangerRunnable<>(exchanger)).start();
        new Thread(new ExchangerRunnable<>(exchanger)).start();
        //new Thread(new ExchangerRunnable<>(exchanger)).start();

        exchanger.exchange("你好我是主线程，我在等待你的排序结果，当你收到这条消息的时候，那么我想你已经排好序了 再见");
    }


    static class ExchangerRunnable<T> implements Runnable {

        Exchanger<T> exchanger;

        public ExchangerRunnable(Exchanger<T> exchanger) {
            this.exchanger = exchanger;
        }

        @Override
        public void run() {
            try {
                TimeUnit.SECONDS.sleep(new Random().nextInt(30));
                System.out.println(Thread.currentThread().getName() + "排序算法结束后 要和其他线程打招呼");
                T result = exchanger.exchange((T) ("你好我是线程" + Thread.currentThread().getName() + "我已经排好序了"));
                System.out.println("线程" +Thread.currentThread().getName()  + "接收到:" + result);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }


}
