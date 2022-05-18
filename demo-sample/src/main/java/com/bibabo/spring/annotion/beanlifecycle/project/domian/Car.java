package com.bibabo.spring.annotion.beanlifecycle.project.domian;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/18 13:59
 * @Description:
 */
public class Car implements InitializingBean, DisposableBean {

    @Override
    public void destroy() throws Exception {
        System.out.println("destory car");
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("create car");
    }
}
