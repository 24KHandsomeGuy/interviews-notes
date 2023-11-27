package com.bibabo.spring.aop;

import lombok.extern.slf4j.Slf4j;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/17 13:56
 * @Description
 */
@Slf4j
public class FuseTerminatorAspect implements MethodInterceptor {
    @Override
    public Object invoke(MethodInvocation methodInvocation) throws Throwable {
        System.out.println("FuseTerminatorAspect.invoke");
        Object o = methodInvocation.proceed();
        System.out.println("FuseTerminatorAspect.end");

        System.out.println(methodInvocation.getMethod().getName()+ "------" +methodInvocation.getMethod().getDeclaringClass().getName());
        return o;
    }
}
