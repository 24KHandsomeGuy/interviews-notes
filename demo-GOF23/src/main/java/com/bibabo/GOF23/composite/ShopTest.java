package com.bibabo.GOF23.composite;

/**
 * @author fukuixiang
 * @date 2020/9/3
 * @time 10:58
 * @description
 */
public class ShopTest {

    public static void main(String[] args) {

        Shop apple = new Goods("苹果",3);
        Shop apple2 = new Goods("苹果",3);
        Shop orange = new Goods("橙子",5);
        //小袋子装水果
        Bag smallBag = new Bag();
        smallBag.add(apple);
        smallBag.add(apple2);
        smallBag.add(orange);

        Shop shoes = new Goods("鞋子",1500);
        Bag bigBag = new Bag();
        bigBag.add(shoes);
        bigBag.add(smallBag);

        int totalPrice = bigBag.calculate();
        System.out.println(totalPrice);
    }

}
