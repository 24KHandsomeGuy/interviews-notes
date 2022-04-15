package com.bibabo.GOF23.mediator.standard;

/**
 * @author fukuixiang
 * @date 2020/9/7
 * @time 10:07
 * @description
 */
public class ColleagueSeller extends Colleague {



    public ColleagueSeller(String name) {
        super(name);
    }

    public void send(String from, String addr) {
        mediator.relay(from,addr);
    }

    public void receive(String from, String addr) {
        System.out.println("来自于" + from + "地址在哪" + addr);
    }
}
