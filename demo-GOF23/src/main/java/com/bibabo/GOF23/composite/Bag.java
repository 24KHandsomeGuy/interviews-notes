package com.bibabo.GOF23.composite;

import java.util.Vector;

/**
 * @author fukuixiang
 * @date 2020/9/3
 * @time 10:47
 * @description 组合树枝节点 包裹
 */
public class Bag implements Shop {

    Vector<Shop> shops = new Vector<Shop>();

    public void add(Shop shop) {
        shops.add(shop);
    }

    public void remove(int i) {
        shops.remove(i);
    }

    public int calculate() {
        int totalPrice = 0;
        for (Shop s : shops) {
           totalPrice += s.calculate();
        }
        return totalPrice;
    }
}
