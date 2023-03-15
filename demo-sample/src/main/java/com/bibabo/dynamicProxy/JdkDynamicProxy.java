package com.bibabo.dynamicProxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * @author fukuixiang
 * @date 2021/2/22
 * @time 14:41
 * @description
 */
public class JdkDynamicProxy implements InvocationHandler {

    private Object target;

    public JdkDynamicProxy(Object target) {
        this.target = target;
    }

    public <T> T getProxy() {
        return (T) Proxy.newProxyInstance(target.getClass().getClassLoader(), target.getClass().getInterfaces(), this);
    }

    /**
     * proxy = com.sun.proxy.$Proxy0
     * public class $Proxy0 implements HelloService {
     *     InvocationHandler h;
     *
     *     void sayHello(String s) {
     *          h.invoke(this, m, s);
     *     }
     * }
     *
     */
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println(proxy.getClass().getName());
        System.out.println("pre handle");
        Object result = method.invoke(target, args);
        System.out.println("after handle");
        return result;
    }
}
