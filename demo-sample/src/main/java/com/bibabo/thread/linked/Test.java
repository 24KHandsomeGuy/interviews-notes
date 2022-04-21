package com.bibabo.thread.linked;

import java.io.IOException;

/**
 * @author fukuixiang
 * @date 2021/3/2
 * @time 16:59
 * @description
 */
public class Test {

    public static void main(String[] args) throws IOException, InterruptedException {

        BaseProcessor processor1 = new ProcessorImpl1();
        BaseProcessor processor2 = new ProcessorImpl2();
        BaseProcessor processor3 = new ProcessorImpl3();
        BaseProcessor processor4 = new ProcessorImpl4();
        processor1.setNext(processor2);
        processor2.setNext(processor3);
        processor3.setNext(processor4);
        // 启动
        processor1.start();

        Order order = new Order(1, 1001, "fukuixiang");
        processor1.processRequest(order);

        // 关闭
        Thread.sleep(10000);
        processor1.shutdown();

    }

}
