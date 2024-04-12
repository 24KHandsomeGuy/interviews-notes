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
        ConsumerAspect consumerAspect = methodInvocation.getMethod().getAnnotation(ConsumerAspect.class);
        ConsumerAspect consumerAspectClass = methodInvocation.getMethod().getDeclaringClass().getAnnotation(ConsumerAspect.class);
        if (consumerAspect != null) {
            System.out.println("FuseTerminatorAspect.invoke.consumerAspect:" + consumerAspect.value());
            return null;
        } else if (consumerAspectClass != null) {
            System.out.println("FuseTerminatorAspect.invoke.consumerAspectClass:" + consumerAspectClass.value());
            return null;
        }
        return methodInvocation.proceed();
    }
}
