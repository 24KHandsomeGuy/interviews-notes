package com.bibabo.java8;

import java.util.function.Predicate;

/**
 * @author fukuixiang
 * @date 2022/4/21
 * @time 11:47
 * @description
 */
public class PredicateTest {

    public static void main(String[] args) {
        Predicate<Integer> p = t -> {
            return t > 0;
        };

        System.out.println(p.test(2));
    }
}
