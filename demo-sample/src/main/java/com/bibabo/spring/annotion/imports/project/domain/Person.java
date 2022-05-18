package com.bibabo.spring.annotion.imports.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 22:32
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Person {

    private Integer age;

    private String name;
}
