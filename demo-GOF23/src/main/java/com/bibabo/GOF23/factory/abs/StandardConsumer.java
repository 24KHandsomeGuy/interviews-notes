package com.bibabo.GOF23.factory.abs;

/**
 * @author fukuixiang
 * @date 2021/2/8
 * @time 17:16
 * @description
 */
public class StandardConsumer implements Consumer {
    @Override
    public void subscribe() {
        System.out.println("标准消息消费器");
    }
}
