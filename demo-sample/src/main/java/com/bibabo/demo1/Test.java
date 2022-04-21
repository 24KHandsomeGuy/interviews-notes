package com.bibabo.demo1;

import demo.OuterClass1;

public class Test {
    public static void main(String[] args) {
        OuterClass1.InnerClass1 innerClass1 = new OuterClass1.InnerClass1();
        System.out.println(innerClass1.getI());
    }
}
