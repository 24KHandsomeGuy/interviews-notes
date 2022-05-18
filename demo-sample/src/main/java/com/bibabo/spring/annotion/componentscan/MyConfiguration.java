package com.bibabo.spring.annotion.componentscan;

import com.bibabo.spring.annotion.conditional.domain.Person;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 17:30
 * @Description:
 */
@Configuration
@ComponentScan(includeFilters = {@ComponentScan.Filter(type = FilterType.CUSTOM, value = {MyTypeFilter.class})},
        useDefaultFilters = false)
public class MyConfiguration {

    @Bean("damoner")
    public Person person() {
        return new Person(10, "damoner");
    }
}
