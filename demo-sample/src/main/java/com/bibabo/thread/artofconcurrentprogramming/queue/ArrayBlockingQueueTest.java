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
 * ArrayBlockingQueue底层为数组，无法保证FIFO顺序，因此，仅使用一把ReentrantLock，借助锁中的同步队列可以保证FIFO顺序
 * BlockingQueue 方法以四种形式出现，对于不能立即满足但可能在将来某一时刻可以满足的操作，这四种形式的处理方式不同：第一种是抛出一个异常，第二种是返回一个特殊值（null 或 false，具体取决于操作），第三种是在操作可以成功前，无限期地阻塞当前线程，第四种是在放弃前只在给定的最大时间限制内阻塞。下表中总结了这些方法：
 *      抛出异常	    特殊值	    阻塞	        超时
 * 插入	add(e)	    offer(e)	put(e)	    offer(e, time, unit)
 * 移除	remove()	poll()	    take()	    poll(time, unit)
 * 检查	element()	peek()	    不可用	    不可用
 *
 */
public class ArrayBlockingQueueTest {

    public static void main(String[] args) throws InterruptedException {

        BlockingQueue<Integer> queue = new ArrayBlockingQueue<>(10);
        queue.offer(1);
        System.out.println(queue.take());
    }
}
