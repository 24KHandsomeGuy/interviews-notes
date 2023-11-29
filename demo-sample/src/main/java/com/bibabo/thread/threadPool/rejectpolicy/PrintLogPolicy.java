package com.bibabo.thread.threadPool.rejectpolicy;

import lombok.extern.slf4j.Slf4j;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/28 16:22
 * @Description
 */
@Slf4j
public class PrintLogPolicy implements RejectedExecutionHandler {

    @Override
    public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
        String msg = String.format("Thread pool is EXHAUSTED!" +
                        " Thread Name: %s, Pool Size: %d (active: %d, core: %d, max: %d, largest: %d), Task: %d (completed: "
                        + "%d)," +
                        " Executor status:(isShutdown:%s, isTerminated:%s, isTerminating:%s)",
                Thread.currentThread().getName(), executor.getPoolSize(), executor.getActiveCount(), executor.getCorePoolSize(), executor.getMaximumPoolSize(),
                executor.getLargestPoolSize(),
                executor.getTaskCount(), executor.getCompletedTaskCount(), executor.isShutdown(), executor.isTerminated(), executor.isTerminating());
        log.warn(msg);
        System.out.println(msg);
    }
}
