package com.bibabo.java8.optional;

import java.util.Optional;

/**
 * @author fukuixiang
 * @date 2022/4/29
 * @time 10:56
 * @description
 */
public class OptionalTest01 {

    public static void main(String[] args) {

        // Object o = null;
        Object o = new Object();
        // System.out.println(o);
        Optional<Object> optional = Optional.ofNullable(o);
        // System.out.println(optional.get());
        // System.out.println(optional.orElse(new Object()));
        // System.out.println(optional.orElseGet(Object::new));

        // System.out.println(optional.isPresent());
        // optional.ifPresent(value -> System.out.println("hello" + value));
        optional.map(value -> new Object());
    }
}
