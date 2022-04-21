package com.bibabo.dynamicProxy;

/**
 * @author fukuixiang
 * @date 2021/2/22
 * @time 14:49
 * @description
 */
public class HelloServiceImpl implements HelloService {
    @Override
    public void sayHello() {
        System.out.println("hello everyone");
    }

    @Override
    public void sayHello2() {
        System.out.println("hello everyone , im so happy");
    }
}
