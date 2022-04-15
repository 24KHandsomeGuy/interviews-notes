package com.bibabo.GOF23.factory.abs;

/**
 * @author fukuixiang
 * @date 2021/2/8
 * @time 17:13
 * @description
 */
public interface RMQFactory {

    Procuder createProcuder();

    Consumer createConsumer();

}
