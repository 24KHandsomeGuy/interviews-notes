package com.bibabo.thread.juc;

import java.util.Random;
import java.util.concurrent.Exchanger;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/3/4
 * @time 14:47
 * @description
 */
public class ExchangerTest {

    public static void main(String[] args) {

        Exchanger<String> exchanger = new Exchanger<>();

        new Thread(new ExchangerRunnable<>(exchanger)).start();
        new Thread(new ExchangerRunnable<>(exchanger)).start();
        //new Thread(new ExchangerRunnable<>(exchanger)).start();
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
                System.out.println(Thread.currentThread().getName() + "处理结束后 要和其他线程打招呼");
                T result = exchanger.exchange((T) ("你好我是线程" + Thread.currentThread().getName()));
                System.out.println("线程" +Thread.currentThread().getName()  + "接收到:" + result);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }


}
