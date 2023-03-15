package com.bibabo.spring.IOC;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/9 10:54
 * @Description:
 * TODO 外部创建bean对象到IOC容器中
 */

public class registerBeanTest {

    public static void main(String[] args) {

        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(AppConfig.class);
        applicationContext.getBeanFactory().registerSingleton("objectBean", new Object());
        System.out.println(applicationContext.getBean("objectBean"));
    }

}
