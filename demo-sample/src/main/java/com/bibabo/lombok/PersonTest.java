package com.bibabo.lombok;

import lombok.SneakyThrows;

import java.lang.reflect.Constructor;

/**
 * @author fukuixiang
 * @date 2021/4/19
 * @time 9:43
 * @description
 */
public class PersonTest {

    public static void main(String[] args) {
        Person person = Person.builder().age(1).name("张三").build();
        getPerson();
    }


    @SneakyThrows
    public static Constructor<?>[] getPerson() {
        Class<Person> clazz = Person.class;
        return clazz.getDeclaredConstructors();
    }

}
