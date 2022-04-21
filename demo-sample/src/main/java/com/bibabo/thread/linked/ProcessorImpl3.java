package com.bibabo.thread.linked;

/**
 * @author fukuixiang
 * @date 2021/3/2
 * @time 15:56
 * @description
 */
public class ProcessorImpl3 extends BaseProcessor {

    @Override
    protected void doProcess(Order order) {
        System.out.println("ProcessorImpl3:" + "线程" + Thread.currentThread().getName() + "正在处理order" + order);
    }
}
