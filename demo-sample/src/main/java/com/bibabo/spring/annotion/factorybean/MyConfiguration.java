package com.bibabo.spring.annotion.factorybean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 17:30
 * @Description:
 */
@Configuration
public class MyConfiguration {

    @Bean
    public RobotFactoryBean robot() {
        return new RobotFactoryBean();
    }
}
