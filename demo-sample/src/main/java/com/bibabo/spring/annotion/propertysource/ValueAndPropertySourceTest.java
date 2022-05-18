package com.bibabo.spring.annotion.propertysource;

import com.bibabo.spring.annotion.propertysource.domain.Person;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/18 14:42
 * @Description:
 */
@Configuration
@PropertySource("classpath:testvalue.properties")
@ComponentScan
public class ValueAndPropertySourceTest {

    public static void main(String[] args) {
        ApplicationContext applicationContext = new AnnotationConfigApplicationContext(ValueAndPropertySourceTest.class);
        System.out.println("myname=" + applicationContext.getEnvironment().getProperty("myname"));

        Person person = applicationContext.getBean("person", Person.class);
        System.out.println(person.getName() + "-----" + person.getAge());
    }
}
