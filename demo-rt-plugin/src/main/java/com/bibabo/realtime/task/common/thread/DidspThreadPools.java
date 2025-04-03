package com.bibabo.realtime.task.common.thread;

import java.util.Calendar;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 20:34
 * @Description
 */
public class DidspThreadPools {

    public static final int CPU_CORE_COUNT = Runtime.getRuntime().availableProcessors();

    public static ExecutorService didspEventAsyncExecuteThreadPool =
            new ThreadPoolExecutor(CPU_CORE_COUNT,
                    CPU_CORE_COUNT,
                    0L, TimeUnit.MILLISECONDS, new ArrayBlockingQueue<>(1000),
                    new DidspThreadFactory("didsp事件异步执行线程池"),
                    new ThreadPoolExecutor.DiscardPolicy());
}
