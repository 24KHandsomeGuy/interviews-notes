package com.bibabo.GOF23.factory.abs;

/**
 * @author fukuixiang
 * @date 2021/2/8
 * @time 17:20
 * @description
 */
public class TransactionProcuder implements Procuder {
    @Override
    public void send() {
        System.out.println("事务消息发送器");
    }
}
