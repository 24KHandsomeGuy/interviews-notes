package com.bibabo.mxbean;

import com.sun.management.OperatingSystemMXBean;

import java.lang.management.GarbageCollectorMXBean;
import java.lang.management.ManagementFactory;
import java.lang.management.RuntimeMXBean;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/28 20:26
 * @Description
 */
public class CpuTest {
    public static void main(String[] args) {
        //运行时情况
        RuntimeMXBean runtime = ManagementFactory.getRuntimeMXBean();
        //操作系统情况
        com.sun.management.OperatingSystemMXBean os = ManagementFactory.getPlatformMXBean(com.sun.management.OperatingSystemMXBean.class);
        //获取GC对象
        List<GarbageCollectorMXBean> gcmList = ManagementFactory.getGarbageCollectorMXBeans();
        new Thread(() -> {
            showCpu(runtime, os, gcmList);
        }).start();

        Thread thread = new Thread(() -> {
            while (!Thread.currentThread().isInterrupted()) {
                new Thread();
            }
        });
        thread.start();

        try {
            TimeUnit.SECONDS.sleep(10);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        thread.interrupt();
        System.out.println("end");
    }

    private static void showCpu(RuntimeMXBean runtime, OperatingSystemMXBean os, List<GarbageCollectorMXBean> gcmList) {
        //上一个cpu运行记录时间点
        long prevUpTime = runtime.getUptime();
        //当时cpu运行时间
        long upTime;
        //上一次cpu运行总时间
        long prevProcessCpuTime = os.getProcessCpuTime();
        //当前cpu运行总时间
        long processCpuTime;
        //上一次gc运行总时间
        long prevProcessGcTime = getTotalGarbageCollectionTime(gcmList);
        //当前gc运行总时间
        long processGcTime;
        //可用内核数量
        int processorCount = os.getAvailableProcessors();
        try {
            TimeUnit.SECONDS.sleep(10);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        processCpuTime = os.getProcessCpuTime();
        processGcTime = getTotalGarbageCollectionTime(gcmList);
        upTime = runtime.getUptime();
        long upTimeDiff = upTime - prevUpTime;
        //计算cpu使用率
        long processTimeDiff = processCpuTime - prevProcessCpuTime;
        //processTimeDiff 取到得是纳秒数  1ms = 1000000ns
        double cpuDetail = processTimeDiff * 100.0 / 1000000 / processorCount / upTimeDiff;
        //计算gccpu使用率
        long processGcTimeDiff = processGcTime - prevProcessGcTime;
        double gcDetail = processGcTimeDiff * 100.0 / 1000000 / processorCount / upTimeDiff;
        System.out.printf("cpu使用率：%s ,gc使用率：%s %n", cpuDetail, gcDetail);
    }

    /**
     * 垃圾回收期总耗时
     */
    protected static long getTotalGarbageCollectionTime(List<GarbageCollectorMXBean> gcmList) {
        long total = -1L;
        for (GarbageCollectorMXBean collectorMXBean : gcmList) {
            total += collectorMXBean.getCollectionTime();
        }
        return total;
    }
}