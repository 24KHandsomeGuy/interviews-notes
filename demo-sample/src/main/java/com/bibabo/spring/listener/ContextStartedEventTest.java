package com.bibabo.spring.listener;

import com.bibabo.spring.annotion.propertysource.ValueAndPropertySourceTest;
import com.bibabo.spring.annotion.propertysource.domain.Person;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import java.io.IOException;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/25 19:57
 * @Description:
 */
@Configuration
@PropertySource("classpath:testvalue.properties")
@ComponentScan
public class ContextStartedEventTest {

    /*@Bean
    ContextStartedEventListener contextStartedEventListener() {
        return new ContextStartedEventListener();
    }*/

    public static void main(String[] args) throws IOException {
        ApplicationContext applicationContext = new AnnotationConfigApplicationContext(ContextStartedEventTest.class);

    }
}
