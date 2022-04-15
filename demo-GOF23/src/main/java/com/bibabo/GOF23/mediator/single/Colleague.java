package com.bibabo.GOF23.mediator.single;

/**
 * @author fukuixiang
 * @date 2020/9/7
 * @time 11:12
 * @description
 */
public abstract class Colleague {

    protected SingleMediator singleMediator;

    public Colleague() {
        this.singleMediator = SingleMediator.getSingleMediator();
    }


    abstract void send();

    abstract void receive();

}
