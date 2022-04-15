package com.bibabo.GOF23.observer.eventobserver;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2020/9/4
 * @time 11:23
 * @description
 */
public abstract class AbstractBell {

    protected List<RingListener> ringListeners = new ArrayList<RingListener>();

    public void add(RingListener ringListener) {
        ringListeners.add(ringListener);
    }

    abstract void notifyAlls(boolean flag);

}
