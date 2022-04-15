package com.bibabo.GOF23.composite;

/**
 * @author fukuixiang
 * @date 2020/9/3
 * @time 10:46
 * @description 组合叶子节点
 */
public class Goods implements Shop {

    private String name;

    private int price;

    public Goods(String name, int price) {
        this.name = name;
        this.price = price;
    }


    public int calculate() {
        return price;
    }
}
