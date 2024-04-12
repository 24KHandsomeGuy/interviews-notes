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

        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config-back.xml");
        WareInfoExtensionServiceImpl impl = context.getBean("wareInfoExtensionServiceImpl", WareInfoExtensionServiceImpl.class);
        WareInfoExtensionServiceImpl2 impl2 = context.getBean("wareInfoExtensionServiceImpl2", WareInfoExtensionServiceImpl2.class);
        impl.getWareInfo();
        System.out.println("=====================================");
        impl.getWareInfo2();
        System.out.println("=====================================");
        impl2.getWareInfo();
    }
}
