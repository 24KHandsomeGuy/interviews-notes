package com.bibabo.GOF23.observer.eventobserver;

import java.util.EventObject;

/**
 * @author fukuixiang
 * @date 2020/9/4
 * @time 11:20
 * @description 铃声事件，直白的说，这个event就是 被观察目标类notify时所传给观察者的参数
 */
public class RingEvent extends EventObject {

    private boolean ringFlag;

    private String desc;

    private String grade;

    public RingEvent(AbstractBell abstractBell,boolean ringFlag, String desc, String grade) {
        super(abstractBell);
        this.ringFlag = ringFlag;
        this.desc = desc;
        this.grade = grade;
    }

    public boolean isRingFlag() {
        return ringFlag;
    }

    public String getDesc() {
        return desc;
    }

    public String getGrade() {
        return grade;
    }
}
