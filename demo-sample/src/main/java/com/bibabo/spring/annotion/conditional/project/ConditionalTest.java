package com.bibabo.spring.annotion.conditional.project;

import com.bibabo.spring.annotion.conditional.project.domain.Person;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.Arrays;
import java.util.Map;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 17:31
 * @Description: 测试Conditional注解
 * VM参数 -Dos.name=Linux 修改os.name
 */
public class ConditionalTest {

    public static void main(String[] args) {
        ApplicationContext applicationContext = new AnnotationConfigApplicationContext(MyConfiguration.class);
        Map<String, Person> personMap = applicationContext.getBeansOfType(Person.class);
        System.out.println(personMap.toString());
    }
}
