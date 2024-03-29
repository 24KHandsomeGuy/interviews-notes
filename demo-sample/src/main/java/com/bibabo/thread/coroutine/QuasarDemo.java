package com.bibabo.thread.coroutine;

import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.fibers.SuspendExecution;
import co.paralleluniverse.strands.channels.Channel;
import co.paralleluniverse.strands.channels.Channels;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/2 17:50
 * @Description:
 */
public class QuasarDemo {

    public static void main(String[] args) throws InterruptedException, SuspendExecution {
        //定义两个Channel
        Channel<Integer> naturals = Channels.newChannel(-1);
        Channel<Integer> squares = Channels.newChannel(-1);

        //运行两个Fiber实现.
        new Fiber(() -> {
            for (int i = 0; i < 10; i++) {
                naturals.send(i);
                System.out.println(Thread.currentThread().getName() + ",send1:" + i);
            }
            naturals.close();
        }).start();


        new Fiber(() -> {
            Integer v;
            while ((v = naturals.receive()) != null) {
                squares.send(v * v);
                System.out.println(Thread.currentThread().getName() + ",send2:" + v * v);
            }
            squares.close();
        }).start();

        printer(squares);

    }

    private static void printer(Channel<Integer> in) throws SuspendExecution, InterruptedException {
        Integer v;
        while ((v = in.receive()) != null) {
            System.out.println(Thread.currentThread().getName() + ",receive3:" + v);
        }
    }
}
