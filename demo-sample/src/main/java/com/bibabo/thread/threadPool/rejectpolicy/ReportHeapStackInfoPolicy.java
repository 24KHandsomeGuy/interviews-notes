package com.bibabo.thread.threadPool.rejectpolicy;

import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.lang.management.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.*;

import static java.lang.String.format;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/28 16:23
 * @Description
 */
@Slf4j
public class ReportHeapStackInfoPolicy implements RejectedExecutionHandler {

    private static volatile long lastPrintTime = 0;

    private static final long TEN_MINUTES_MILLS = 10 * 60 * 1000;

    private static final String DEFAULT_DATETIME_FORMAT = "yyyy-MM-dd_HH-mm-ss";

    private static final Semaphore guard = new Semaphore(1);


    @Override
    public void rejectedExecution(Runnable r, ThreadPoolExecutor e) {
        long now = System.currentTimeMillis();

        //dump every 10 minutes
        if (now - lastPrintTime < TEN_MINUTES_MILLS) {
            log.warn("Report heap stack info reject policy has been reported {} seconds ago.", (now - lastPrintTime) / 1000);
            return;
        }

        if (!guard.tryAcquire()) {
            log.warn("Report heap stack info reject policy try acquire semaphore failed.");
            return;
        }
        // create new thread to execute heap info dump
        ExecutorService pool = Executors.newSingleThreadExecutor();
        pool.execute(() -> {
            String dumpPath = getDumpPath();
            if (dumpPath == null) {
                guard.release();
                return;
            }
            SimpleDateFormat sdf = new SimpleDateFormat(DEFAULT_DATETIME_FORMAT);
            String dateStr = sdf.format(new Date());
            //try-with-resources
            try (FileOutputStream jStackStream = new FileOutputStream(new File(dumpPath, "JStack.log" + "." + dateStr))) {
                jstack(jStackStream);
            } catch (Throwable t) {
                log.error("Dump jStack error", t);
            } finally {
                guard.release();
            }
            lastPrintTime = System.currentTimeMillis();
        });
        pool.shutdown();
    }

    private String getDumpPath() {
        String dumpPath = "/Users/fukuixiang/work/IT/Dmall/log";
        final File dumpDirectory = new File(dumpPath);
        if (dumpDirectory.exists()) {
            return dumpPath;
        }
        if (dumpDirectory.mkdirs()) {
            log.info(format("dump directory[%s] created", dumpDirectory.getAbsolutePath()));
            return dumpPath;
        } else {
            log.warn(format("dump directory[%s] can't be created", dumpDirectory.getAbsolutePath()));
            return null;
        }
    }

    public void jstack(OutputStream stream) throws Exception {
        ThreadMXBean threadMxBean = ManagementFactory.getThreadMXBean();
        for (ThreadInfo threadInfo : threadMxBean.dumpAllThreads(true, true)) {
            stream.write(getThreadDumpString(threadInfo).getBytes());
        }
    }

    private String getThreadDumpString(ThreadInfo threadInfo) {
        StringBuilder sb = new StringBuilder();
        sb.append("\"").append(threadInfo.getThreadName()).append("\"").append(" Id=").append(threadInfo.getThreadId()).append(" ").append(threadInfo.getThreadState());
        if (threadInfo.getLockName() != null) {
            sb.append(" on ").append(threadInfo.getLockName());
        }
        if (threadInfo.getLockOwnerName() != null) {
            sb.append(" owned by \"").append(threadInfo.getLockOwnerName()).append("\" Id=").append(threadInfo.getLockOwnerId());
        }
        if (threadInfo.isSuspended()) {
            sb.append(" (suspended)");
        }
        if (threadInfo.isInNative()) {
            sb.append(" (in native)");
        }
        sb.append('\n');
        int i = 0;

        StackTraceElement[] stackTrace = threadInfo.getStackTrace();
        MonitorInfo[] lockedMonitors = threadInfo.getLockedMonitors();
        for (; i < stackTrace.length && i < 32; i++) {
            StackTraceElement ste = stackTrace[i];
            sb.append("\tat ").append(ste.toString());
            sb.append('\n');
            if (i == 0 && threadInfo.getLockInfo() != null) {
                Thread.State ts = threadInfo.getThreadState();
                switch (ts) {
                    case BLOCKED:
                        sb.append("\t-  blocked on ").append(threadInfo.getLockInfo());
                        sb.append('\n');
                        break;
                    case WAITING:
                        sb.append("\t-  waiting on ").append(threadInfo.getLockInfo());
                        sb.append('\n');
                        break;
                    case TIMED_WAITING:
                        sb.append("\t-  waiting on ").append(threadInfo.getLockInfo());
                        sb.append('\n');
                        break;
                    default:
                }
            }

            for (MonitorInfo mi : lockedMonitors) {
                if (mi.getLockedStackDepth() == i) {
                    sb.append("\t-  locked ").append(mi);
                    sb.append('\n');
                }
            }
        }
        if (i < stackTrace.length) {
            sb.append("\t...");
            sb.append('\n');
        }

        LockInfo[] locks = threadInfo.getLockedSynchronizers();
        if (locks.length > 0) {
            sb.append("\n\tNumber of locked synchronizers = ").append(locks.length);
            sb.append('\n');
            for (LockInfo li : locks) {
                sb.append("\t- ").append(li);
                sb.append('\n');
            }
        }
        sb.append('\n');
        return sb.toString();
    }
}
