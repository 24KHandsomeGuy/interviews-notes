package com.bibabo.spring.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/17 13:50
 * @Description
 */
public class AopTest {

    public static void main(String[] args) {

        ApplicationContext context = new ClassPathXmlApplicationContext("com/bibabo/spring/aop/spring-config-back.xml");
        WareInfoExtensionServiceImpl impl = context.getBean("wareInfoExtensionServiceImpl", WareInfoExtensionServiceImpl.class);
        impl.getWareInfo();
    }
}
