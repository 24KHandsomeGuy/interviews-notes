package com.bibabo.GOF23.observer.eventobserver;

/**
 * @author fukuixiang
 * @date 2020/9/4
 * @time 10:55
 * @description
 */
public class ObserverTest {

    public static void main(String[] args) {

        Bell bell = new Bell();
        bell.add(new Teacher());
        bell.add(new Student());
        bell.add(new Student());

        bell.notifyAlls(false);

    }

}
