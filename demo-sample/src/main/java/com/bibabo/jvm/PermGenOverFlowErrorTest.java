package com.bibabo.jvm;

import jdk.dynamicProxy.HelloService;
import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

import java.lang.reflect.Method;

/**
 * @author fukuixiang
 * @date 2021/3/22
 * @time 18:51
 * @description
 */
public class PermGenOverFlowErrorTest {

    public static void main(String[] args) {

        while (true) {
            Enhancer enhancer = new Enhancer();
            enhancer.setSuperclass(HelloService.class);
            enhancer.setUseCache(false);
            enhancer.setCallback(new MethodInterceptor() {
                @Override
                public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
                    return null;
                }
            });
            enhancer.create();
        }
    }

}
