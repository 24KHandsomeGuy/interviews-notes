package com.bibabo.jd.asyncTool;

import com.jd.platform.async.callback.ICallback;
import com.jd.platform.async.callback.IWorker;
import com.jd.platform.async.worker.WorkResult;
import com.jd.platform.async.wrapper.WorkerWrapper;

import java.util.Map;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/2/1 15:46
 * @Description 任务 + 回调
 */
public class ParWorker implements IWorker<Integer, Long>, ICallback<Integer, Long> {

    @Override
    public void begin() {
        System.out.println("000准备开始执行任务" + "线程：" + Thread.currentThread().getName());
    }

    @Override
    public void result(boolean b, Integer integer, WorkResult<Long> workResult) {
        System.out.println("000任务执行结果：" + b + ", param:" + integer + ", workResult:" + workResult.getResult()+ "线程：" + Thread.currentThread().getName());
    }

    @Override
    public Long action(Integer integer, Map<String, WorkerWrapper> map) {
        int val = new Random().nextInt();
        if (val % 2 == 0) {
            System.out.println("000任务执行中，偶数异常，" + "线程：" + Thread.currentThread().getName());
            throw new RuntimeException("偶数异常");
        }
        try {
            TimeUnit.SECONDS.sleep(integer);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        System.out.println("000任务执行中，睡眠" + integer + "s，当前值：" + val + "线程：" + Thread.currentThread().getName());
        return Double.valueOf(val).longValue();
    }

    @Override
    public Long defaultValue() {
        return -1L;
    }
}
