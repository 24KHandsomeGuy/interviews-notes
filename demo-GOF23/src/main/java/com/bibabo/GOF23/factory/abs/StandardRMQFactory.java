package com.bibabo.GOF23.factory.abs;

/**
 * @author fukuixiang
 * @date 2021/2/8
 * @time 17:13
 * @description
 */
public class StandardRMQFactory implements RMQFactory {

    @Override
    public Procuder createProcuder() {
        return new StandardProcuder();
    }

    @Override
    public Consumer createConsumer() {
        return new StandardConsumer();
    }
}
