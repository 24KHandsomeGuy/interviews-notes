package com.bibabo.thread.threadPool.rejectpolicy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.atomic.AtomicLong;

/**
 * @author fukuixiang
 * @date 2021/8/13
 * @time 17:45
 * @description 创建一个新线程去执行策略
 */
public class NewThreadRunsPolicy implements RejectedExecutionHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(NewThreadRunsPolicy.class);

    private static final AtomicLong newThreadCntAtomic = new AtomicLong(1);

    @Override
    public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
        LOGGER.info("拒绝策略：NewThreadExecutePolicy，任务：{}", r);
        new Thread(r, "NewThreadExecutePolicy" + newThreadCntAtomic.get()).start();
        LOGGER.info("拒绝策略：NewThreadExecutePolicy，当前已创建的线程数为：{}", newThreadCntAtomic.incrementAndGet());
    }
}
