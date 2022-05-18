package com.bibabo.spring.annotion.beanlifecycle.project.domian;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/18 13:49
 * @Description:
 */
public class Train {

    /**
     * 品牌
     */
    private String trainBrand;

    public Train(String trainBrand) {
        this.trainBrand = trainBrand;
        System.out.println("create train " + trainBrand);
    }

    public void refuelTheTrain() {
        System.out.println("refuel the Train " + trainBrand);
    }

    public void destoryTheTrain() {
        System.out.println("destory the Train " + trainBrand);
    }
}
