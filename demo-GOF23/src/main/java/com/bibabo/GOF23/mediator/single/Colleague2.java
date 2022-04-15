package com.bibabo.GOF23.mediator.single;

/**
 * @author fukuixiang
 * @date 2020/9/7
 * @time 11:16
 * @description
 */
public class Colleague2 extends Colleague {


    void send() {
        System.out.println("同事2发送");
        singleMediator.relay(this);
    }

    void receive() {
        System.out.println("同事2接收");
    }
}
