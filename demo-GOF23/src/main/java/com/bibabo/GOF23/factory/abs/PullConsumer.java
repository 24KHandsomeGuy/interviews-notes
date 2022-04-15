package com.bibabo.GOF23.factory.abs;

/**
 * @author fukuixiang
 * @date 2021/2/8
 * @time 17:18
 * @description
 */
public class PullConsumer implements Consumer {
    @Override
    public void subscribe() {
        System.out.println("一直拉取消费器");
    }
}
