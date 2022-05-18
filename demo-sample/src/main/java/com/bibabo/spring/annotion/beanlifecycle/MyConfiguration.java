package com.bibabo.spring.annotion.beanlifecycle;

import com.bibabo.spring.annotion.beanlifecycle.domian.AirPlan;
import com.bibabo.spring.annotion.beanlifecycle.domian.Car;
import com.bibabo.spring.annotion.beanlifecycle.domian.Train;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 17:30
 * @Description:
 */
@Configuration
@ComponentScans({
        @ComponentScan("com.bibabo.spring.annotion.beanlifecycle")
})
public class MyConfiguration {

    @Bean(initMethod = "refuelTheTrain", destroyMethod = "destoryTheTrain")
    @Lazy
    public Train train() {
        return new Train("Benz");
    }

    @Bean
    public Car car() {
        return new Car();
    }

    @Bean
    public AirPlan airPlan() {
        return new AirPlan();
    }
}
