package com.bibabo.GOF23.observer.eventobserver;

import java.util.EventListener;
import java.util.Observable;
import java.util.Observer;

/**
 * @author fukuixiang
 * @date 2020/9/4
 * @time 10:52
 * @description
 */
public class Teacher implements RingListener {


    public void handle(RingEvent e) {
        if (e.isRingFlag()) {
            System.out.println("老师" + e.getDesc() + "呜呜呜");
        } else {
            System.out.println("老师" + e.getDesc() + "哈哈哈");
        }
    }
}
