package com.bibabo.java8.annotion;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/18 22:31
 * @Description:
 */
@MyAnnotation(1000)
public class World {

    @MyAnnotation(2000)
    public void sayHello() {
        System.out.println("Hello World");
    }
}
