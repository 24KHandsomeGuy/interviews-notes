package com.bibabo.spring.annotion.beanlifecycle;

import com.bibabo.spring.annotion.beanlifecycle.domian.Train;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.Arrays;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 17:31
 * @Description:
 */
public class BeanLifecycleTest {

    public static void main(String[] args) {
        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(MyConfiguration.class);
        String[] beanNames = applicationContext.getBeanDefinitionNames();
        System.out.println(Arrays.toString(beanNames).replaceAll(",", "\n"));

        applicationContext.getBean("train", Train.class);
        applicationContext.close();
    }
}
