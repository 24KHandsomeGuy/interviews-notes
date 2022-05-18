package com.bibabo.spring.annotion.conditional.project;

import com.bibabo.spring.annotion.conditional.project.condition.LinuxCondition;
import com.bibabo.spring.annotion.conditional.project.condition.WindowsCondition;
import com.bibabo.spring.annotion.conditional.project.domain.Person;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Conditional;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 17:30
 * @Description:
 */
@Configuration
@ComponentScan
public class MyConfiguration {

    @Conditional(WindowsCondition.class)
    @Bean("damon")
    public Person damon() {
        return new Person(1, "damon");
    }

    @Bean("tom")
    @Conditional(LinuxCondition.class)
    public Person tom() {
        return new Person(1, "tom");
    }
}
