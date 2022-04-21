package com.bibabo.thread.linked;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * @author fukuixiang
 * @date 2021/3/2
 * @time 15:52
 * @description 异步责任链接口
 */
abstract class BaseProcessor {

    private BlockingQueue<Order> queue = new LinkedBlockingQueue<>();

    private BaseProcessor next;

    private Thread thread;

    public void setNext(BaseProcessor processor) {
        this.next = processor;
    }

    public void processRequest(Order order) {
        queue.add(order);
        // 如果要做全异步 就在这调用下一个节点 并行
    }

    public void process(Order order) {
        doProcess(order);
        if (next != null) {
            next.processRequest(order);
        }
    }

    protected abstract void doProcess(Order order);

    public void start() {
        thread = new OrderProcessRunner(queue, this);
        thread.start();
        if (next != null) {
            next.start();
        }
    }

    public void shutdown() {
        thread.interrupt();
        if (next != null) {
            next.shutdown();
        }
    }
}
