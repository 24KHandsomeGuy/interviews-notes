package com.bibabo.GOF23.factory.abs;

/**
 * @author fukuixiang
 * @date 2021/2/8
 * @time 17:18
 * @description
 */
public class OrderRMQFactory implements RMQFactory {
    @Override
    public Procuder createProcuder() {
        return new OrderProcuder();
    }

    @Override
    public Consumer createConsumer() {
        return new OrderConsumer();
    }
}
