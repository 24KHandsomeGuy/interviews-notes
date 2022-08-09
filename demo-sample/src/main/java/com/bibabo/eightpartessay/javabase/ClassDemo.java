package com.bibabo.eightpartessay.javabase;

/**
 * @Author: Damon Fu
 * @Date: 2022/8/1 16:00
 * @Description:
 */
public class ClassDemo {
}

class ClassDemo2 {

    private int i;

    public static void main(String[] args) {
        ClassDemo2 d2 = new ClassDemo2();
        System.out.println(d2.i);

        // 局部变量没有默认初始值
        int j;
        //System.out.println(j);
    }
}
