package com.bibabo.GOF23.mediator.single;

/**
 * @author fukuixiang
 * @date 2020/9/7
 * @time 11:16
 * @description
 */
public class Colleague1 extends Colleague {

    void send() {
        System.out.println("同事1发送");
        singleMediator.relay(this);
    }

    void receive() {
        System.out.println("同事1接收");
    }
}
