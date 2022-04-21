package com.bibabo.thread;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author fukuixiang
 * @date 2021/3/11
 * @time 14:39
 * @description
 */
public class ThreadPrint {

    public static void main(String[] args) throws InterruptedException {
        // 三个线程 循环打印 123 456 789 到75
        // 必须要有一个循环链来控制线程的打印
        // 使用condition做控制
        AtomicInteger atomicInteger = new AtomicInteger(1);
        MyRunnable runnable1 = new MyRunnable(atomicInteger);
        MyRunnable runnable2 = new MyRunnable(atomicInteger);
        MyRunnable runnable3 = new MyRunnable(atomicInteger);
        runnable1.setNext(runnable2);
        runnable2.setNext(runnable3);
        runnable3.setNext(runnable1);
        new Thread(runnable1).start();
        new Thread(runnable2).start();
        new Thread(runnable3).start();

        Thread.sleep(1);
        synchronized (runnable1) {
            runnable1.notify();
        }
    }


    static class MyRunnable implements Runnable {

        MyRunnable next;
        AtomicInteger atomicInteger;

        public MyRunnable(AtomicInteger atomicInteger) {
            this.atomicInteger = atomicInteger;
        }

        public void setNext(MyRunnable next) {
            this.next = next;
        }

        @Override
        public void run() {
            while (true) {
                synchronized (this) {
                    try {
                        wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                    // process
                    for (int i = 0; i < 3; i++) {
                        if (atomicInteger.get() > 75) {
                            synchronized (next) {
                                next.notify();
                            }
                            return;
                        }
                        System.out.println(atomicInteger.getAndIncrement());
                    }

                    synchronized (next) {
                        next.notify();
                    }
                }
            }
        }
    }

}
