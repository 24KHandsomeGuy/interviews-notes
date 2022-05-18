package com.bibabo.spring.annotion.propertysource.domain;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/18 14:50
 * @Description:
 */
@Component
@Data
public class Person {

    @Value("#{${myage} - 10}")
    private Integer age;

    @Value("${myname}")
    private String name;
}
