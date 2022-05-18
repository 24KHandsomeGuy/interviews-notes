package com.bibabo.spring.annotion.componentscan.project;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.Arrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 17:31
 * @Description:
 */
public class ComponentScanTest {

    public static void main(String[] args) {
        ApplicationContext applicationContext = new AnnotationConfigApplicationContext(MyConfiguration.class);
        String[] beanNames = applicationContext.getBeanDefinitionNames();
        System.out.println(Arrays.toString(beanNames).replaceAll(",", "\n"));
    }
}
