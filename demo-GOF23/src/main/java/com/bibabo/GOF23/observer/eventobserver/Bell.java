package com.bibabo.GOF23.observer.eventobserver;

import java.util.Observable;

/**
 * @author fukuixiang
 * @date 2020/9/4
 * @time 10:50
 * @description
 */
public class Bell extends AbstractBell {

    void notifyAlls(boolean flag) {
        for (RingListener r : ringListeners) {
            String desc = flag ? "上课" : "下课";
            RingEvent event = new RingEvent(this,flag,desc,"1");
            r.handle(event);
        }
    }
}
