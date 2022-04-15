package com.bibabo.GOF23.factory.abs;

/**
 * @author fukuixiang
 * @date 2021/2/8
 * @time 17:17
 * @description
 */
public class OrderConsumer implements Consumer {
    @Override
    public void subscribe() {
        System.out.println("顺序消息消费器");
    }
}
