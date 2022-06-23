package com.bibabo.thread.artofconcurrentprogramming.producerconsumermodel;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/23 11:12
 * @Description:
 */
public class MyThreadPoolTest {

    public static void main(String[] args) throws InterruptedException {

        MyThreadPool<Runner> myThreadPool = new MyThreadPool<>();
        for (int i = 0;i < 1000;i ++) {
            myThreadPool.execute(new Runner("这是消息：" + i));
        }
        Thread.sleep(5000);
        myThreadPool.shutdown();
    }

    private static class Runner implements Runnable {

        private String message;

        public Runner(String message) {
            this.message = message;
        }

        @Override
        public void run() {
            System.out.println(Thread.currentThread().getName() + "正在执行,message:" + message);
        }
    }
}
