package com.bibabo.GOF23.composite;

/**
 * @author fukuixiang
 * @date 2020/9/3
 * @time 10:56
 * @description 树枝节点子节点  精美包装 需要花钱
 */
public class ExquisiteBag extends Bag {

    private int price;

    public ExquisiteBag(int price) {
        this.price = price;
    }

    @Override
    public int calculate() {
        return super.calculate() + this.price;
    }
}
