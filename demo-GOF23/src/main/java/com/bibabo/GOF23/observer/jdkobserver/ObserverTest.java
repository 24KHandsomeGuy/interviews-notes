package com.bibabo.GOF23.observer.jdkobserver;

import java.util.Observable;

/**
 * @author fukuixiang
 * @date 2020/9/4
 * @time 10:55
 * @description
 */
public class ObserverTest {

    public static void main(String[] args) {

        Bell observable = new Bell();
        Student student = new Student();
        Student student2 = new Student();
        Student student3 = new Student();
        Teacher teacher = new Teacher();
        observable.addObserver(student);
        observable.addObserver(student2);
        observable.addObserver(student3);
        observable.addObserver(teacher);

        observable.ring(true);

        System.out.println(" ------------------------ ");

        observable.ring(false);
    }

}
