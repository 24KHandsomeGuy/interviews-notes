package com.bibabo.thread.threadPool;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ScheduledThreadPoolExecutor;

/**
 * @author fukuixiang
 * @date 2021/8/13
 * @time 16:38
 * @description 定时任务线程池工具
 */
public class ScheduledThreadPoolTaskExecutor {

    // CPU核数
    private static final int CPU_CNT = Runtime.getRuntime().availableProcessors();

    // 被包装的线程池
    private ScheduledThreadPoolExecutor executor;

    public ScheduledThreadPoolTaskExecutor() {
        executor = new ScheduledThreadPoolExecutor(CPU_CNT);
    }

    public void setRejectedExecutionHandler(RejectedExecutionHandler rejectedExecutionHandler) {
        executor.setRejectedExecutionHandler(rejectedExecutionHandler);
    }

    public void shutdown() {
        executor.shutdown();
    }
}
