package com.bibabo.spring.annotion.factorybean;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.Arrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 17:31
 * @Description: 测试Conditional注解
 * VM参数 -Dos.name=Linux 修改os.name
 */
public class FactoryBeanTest {

    public static void main(String[] args) {
        ApplicationContext applicationContext = new AnnotationConfigApplicationContext(MyConfiguration.class);
        String[] beanNames = applicationContext.getBeanDefinitionNames();
        System.out.println(Arrays.toString(beanNames).replaceAll(",", "\n"));

        // 拿到的是Robot，不是factoryBean
        System.out.println(applicationContext.getBean("robot").hashCode());
        System.out.println(applicationContext.getBean("robot").hashCode());

        // 加& 可以拿到他的factoryBean
        /**
         * @see org.springframework.beans.factory.BeanFactory#FACTORY_BEAN_PREFIX
         */
        System.out.println(applicationContext.getBean("&robot").getClass());
    }
}
