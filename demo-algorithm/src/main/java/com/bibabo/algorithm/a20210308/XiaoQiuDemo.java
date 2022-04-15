package com.bibabo.algorithm.a20210308;

/**
 * @author fukuixiang
 * @date 2021/3/8
 * @time 18:49
 * @description
 */
public class XiaoQiuDemo {

    public static void main(String[] args) {

        // 小球从100米高空落地，每次弹起的高度是之前的一半，请问第10次落地时，总经历的路程是多少
        double high = 100;
        double totalDistance = 100;
        for (int i = 0; i < 9; i ++) {
            totalDistance += high;
            high /= 2;
        }
        System.out.println(totalDistance);
        System.out.println(high);

    }

}
