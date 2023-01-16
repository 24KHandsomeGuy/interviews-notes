package com.bibabo.thread.artofconcurrentprogramming.queue;

import java.util.Queue;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/1/13 16:41
 * @Description:
 * TODO LinkedBlockingQueue使用两把锁，尽可能做到了读写锁不争抢。而ArrayBlockingQueue仅使用一把ReentrantLock，为什么？
 * A：LinkedBlockingQueue底层使用链表的最大长度Integer.MAX的有界队列，链表天然支持顺序，可以保证FIFO。
 *    ArrayBlockingQueue底层为数组，无法保证FIFO顺序，因此，仅使用一把ReentrantLock，借助锁中的同步队列可以保证FIFO顺序
 */
public class ArrayBlockingQueueTest {

    public static void main(String[] args) throws InterruptedException {

        BlockingQueue<Integer> queue = new ArrayBlockingQueue<>(10);
        queue.offer(1);
        System.out.println(queue.take());
    }
}
