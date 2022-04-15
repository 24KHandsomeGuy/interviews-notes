package com.bibabo.GOF23.factory.abs;

/**
 * @author fukuixiang
 * @date 2021/2/8
 * @time 17:20
 * @description
 */
public class TransactionRMQFactory implements RMQFactory {
    @Override
    public Procuder createProcuder() {
        return new TransactionProcuder();
    }

    @Override
    public Consumer createConsumer() {
        throw new RuntimeException("暂时不支持该类型的消费器 无法创建");
    }
}
