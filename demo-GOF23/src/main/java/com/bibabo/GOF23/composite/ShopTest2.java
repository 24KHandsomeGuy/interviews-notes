package com.bibabo.GOF23.composite;

/**
 * @author fukuixiang
 * @date 2020/9/3
 * @time 10:58
 * @description
 */
public class ShopTest2 {

    public static void main(String[] args) {

        Shop shoes = new Goods("NIKE",1500);
        Shop gift = new GiftGoods("赠品鞋拔子");
        //精美包装50元
        Bag bigBag = new ExquisiteBag(50);
        bigBag.add(shoes);
        bigBag.add(gift);

        int totalPrice = bigBag.calculate();
        System.out.println(totalPrice);
    }

}
