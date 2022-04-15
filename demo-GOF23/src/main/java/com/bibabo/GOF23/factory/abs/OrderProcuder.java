package com.bibabo.GOF23.factory.abs;

/**
 * @author fukuixiang
 * @date 2021/2/8
 * @time 17:17
 * @description
 */
public class OrderProcuder implements Procuder {
    @Override
    public void send() {
        System.out.println("顺序消息发送器");
    }
}
