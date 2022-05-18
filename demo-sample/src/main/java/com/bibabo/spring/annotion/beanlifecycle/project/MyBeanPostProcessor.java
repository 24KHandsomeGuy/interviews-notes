package com.bibabo.spring.annotion.beanlifecycle.project;

import com.bibabo.spring.annotion.beanlifecycle.project.domian.Metro;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.stereotype.Component;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/18 14:12
 * @Description:
 */
@Component
public class MyBeanPostProcessor implements BeanPostProcessor {

    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        if (bean instanceof Metro) {
            System.out.println("postProcessBeforeInitialization bean metro do something sample");
        }
        return bean;
    }

    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        if (bean instanceof Metro) {
            System.out.println("postProcessAfterInitialization metro do something sample");
        }
        return bean;
    }
}
