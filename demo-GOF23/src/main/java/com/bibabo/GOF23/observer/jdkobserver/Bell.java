package com.bibabo.GOF23.observer.jdkobserver;

import java.util.Observable;

/**
 * @author fukuixiang
 * @date 2020/9/4
 * @time 10:50
 * @description
 */
public class Bell extends Observable {

    void ring(boolean flag) {
        setChanged();
        notifyObservers(flag);
    }

}
