package com.bibabo.GOF23.factory.abs;

/**
 * @author fukuixiang
 * @date 2021/2/8
 * @time 17:19
 * @description
 */
public class PullRMQFactory implements RMQFactory {
    @Override
    public Procuder createProcuder() {
        throw new RuntimeException("暂时不存在该类型的消费器 无法创建");
    }

    @Override
    public Consumer createConsumer() {
        return new PullConsumer();
    }
}
