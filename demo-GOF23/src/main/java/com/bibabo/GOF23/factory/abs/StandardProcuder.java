package com.bibabo.GOF23.factory.abs;

/**
 * @author fukuixiang
 * @date 2021/2/8
 * @time 17:15
 * @description
 */
public class StandardProcuder implements Procuder {
    @Override
    public void send() {
        System.out.println("标准消息发送器");
    }
}
