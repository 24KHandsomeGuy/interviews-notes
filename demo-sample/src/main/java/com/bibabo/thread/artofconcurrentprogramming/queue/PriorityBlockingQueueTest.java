package com.bibabo.thread.artofconcurrentprogramming.queue;

import java.util.Comparator;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.PriorityBlockingQueue;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/1/13 16:43
 * @Description:
 */
public class PriorityBlockingQueueTest {

    public static void main(String[] args) throws InterruptedException {
        BlockingQueue<Integer> queue = new PriorityBlockingQueue<>();// Integer.compareTo();
        queue.offer(10);
        queue.offer(8);
        queue.offer(3);

        System.out.println(queue.take());// 3
        System.out.println(queue.take());// 8
        System.out.println(queue.take());// 10


        BlockingQueue<PriorityNode> queueNode = new PriorityBlockingQueue<>(5, new Comparator<PriorityNode>() {
            @Override
            public int compare(PriorityNode o1, PriorityNode o2) {
                return o2.id - o1.id;
            }
        });
        for (int i = 0; i < 5; i++) {
            PriorityNode node = new PriorityNode(i, "node" + i);
            queueNode.offer(node);
        }
        for (int i = 0; i < 5; i++) {
            System.out.println(queueNode.take().name);
        }
    }

    private static class PriorityNode {
        private Integer id;

        private String name;

        public PriorityNode(Integer id, String name) {
            this.id = id;
            this.name = name;
        }
    }
}
