package com.bibabo.GOF23.observer.jdkobserver;

import java.util.Observable;
import java.util.Observer;

/**
 * @author fukuixiang
 * @date 2020/9/4
 * @time 10:52
 * @description
 */
public class Teacher implements Observer {


    public void update(Observable o, Object arg) {
        if ((Boolean) arg) {
            System.out.println("上课 准备教材去教室");
        } else {
            System.out.println("下课 回办公室");
        }
    }
}
