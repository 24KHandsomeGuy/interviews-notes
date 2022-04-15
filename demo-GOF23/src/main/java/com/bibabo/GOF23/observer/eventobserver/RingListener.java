package com.bibabo.GOF23.observer.eventobserver;

import java.util.EventListener;

/**
 * @author fukuixiang
 * @date 2020/9/4
 * @time 11:24
 * @description
 */
public interface RingListener extends EventListener {

    void handle(RingEvent e);

}
