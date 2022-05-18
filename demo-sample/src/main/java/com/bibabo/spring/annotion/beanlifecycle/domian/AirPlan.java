package com.bibabo.spring.annotion.beanlifecycle.domian;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/18 14:02
 * @Description:
 */
public class AirPlan {

    @PostConstruct
    public void createAirPlan() {
        System.out.println("create airPlan");
    }

    @PreDestroy
    public void destroyAirPlan() {
        System.out.println("destroy airPlan");
    }
}
