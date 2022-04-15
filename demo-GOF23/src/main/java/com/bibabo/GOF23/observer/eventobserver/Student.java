package com.bibabo.GOF23.observer.eventobserver;

import java.util.Observable;
import java.util.Observer;

/**
 * @author fukuixiang
 * @date 2020/9/4
 * @time 10:54
 * @description
 */
public class Student implements RingListener {


    public void handle(RingEvent e) {
        if (e.isRingFlag()) {
            System.out.println("学生" + e.getDesc() + "哈哈哈");
        } else {
            System.out.println("学生" + e.getDesc() + "呜呜呜");
        }
    }
}
