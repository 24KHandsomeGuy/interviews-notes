package com.bibabo.thread.artofconcurrentprogramming;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/22 14:11
 * @Description: 在Windows OS环境下优先级并没有生效
 */
public class PriorityTest {
    private static volatile boolean notStart = true;
    private static volatile boolean notEnd = true;

    public static void main(String[] args) throws InterruptedException {
        List<Job> jobs = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            int priority = i < 5 ? Thread.MIN_PRIORITY : Thread.MAX_PRIORITY;
            Job job = new Job(priority);
            jobs.add(job);
            new Thread(job, "job" + i).start();
        }
        notStart = false;
        TimeUnit.SECONDS.sleep(10);
        notEnd = false;
        jobs.forEach(System.out::println);
    }

    static class Job implements Runnable {

        private int priority;

        private int jobCount;

        public Job(int priority) {
            this.priority = priority;
        }

        @Override
        public void run() {
            while (notStart) {
                Thread.yield();
            }
            while (notEnd) {
                Thread.yield();
                jobCount++;
            }
        }

        @Override
        public String toString() {
            return "Job{" +
                    "priority=" + priority +
                    ", jobCount=" + jobCount +
                    '}';
        }
    }
}
