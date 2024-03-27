package com.bibabo.dynamicProxy;

/**
 * @author fukuixiang
 * @date 2021/2/22
 * @time 14:35
 * @description
 */
public class dynamicProxyTest {

    public static void main(String[] args) {
        HelloService helloService = new JdkDynamicProxy(new HelloServiceImpl()).getProxy();
        helloService.sayHello();
        helloService.sayHello2();
    }
}
