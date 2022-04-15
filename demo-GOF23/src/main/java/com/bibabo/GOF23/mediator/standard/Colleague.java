package com.bibabo.GOF23.mediator.standard;

/**
 * @author fukuixiang
 * @date 2020/9/7
 * @time 9:55
 * @description 同事者接口
 */
public abstract class Colleague {

    String name;

    public String getName() {
        return name;
    }

    public Colleague(String name) {
        this.name = name;
    }

    /**
     * 持有 中介实例
     */
    protected Mediator mediator;

    public void setMediator(Mediator mediator) {
        this.mediator = mediator;
    }

    abstract void send(String from, String addr);

    abstract void receive(String from, String addr);

}
