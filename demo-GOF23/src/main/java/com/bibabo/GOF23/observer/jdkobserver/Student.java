package com.bibabo.GOF23.observer.jdkobserver;

import java.util.Observable;
import java.util.Observer;

/**
 * @author fukuixiang
 * @date 2020/9/4
 * @time 10:54
 * @description
 */
public class Student implements Observer {

    public void update(Observable o, Object arg) {
        if ((Boolean) arg) {
            System.out.println("上课 离开操场去教室");
        } else {
            System.out.println("下课 去操场玩");
        }
    }
}
