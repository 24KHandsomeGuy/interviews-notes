package com.bibabo.GOF23.mediator.standard;

/**
 * @author fukuixiang
 * @date 2020/9/7
 * @time 10:19
 * @description
 */
public class ColleagueTest {

    public static void main(String[] args) {
        Colleague buier1 = new ColleagueBuier("aa");
        Colleague buier2 = new ColleagueBuier("王五");
        Colleague buier3 = new ColleagueBuier("vv");
        Colleague buier4 = new ColleagueBuier("小刘");
        Colleague buier5 = new ColleagueBuier("bb");
        Colleague seller = new ColleagueSeller("卖家张三");

        Mediator mediator = new MediatorImpl();
        mediator.register(buier1);
        mediator.register(buier2);
        mediator.register(buier3);
        mediator.register(buier4);
        mediator.register(buier5);
        mediator.register(seller);

        //卖家要通知买家
        seller.send("卖家张三","北京西二环105平方米新楼盘");

        buier2.send("王五","我去看房");
        buier4.send("小刘","我也去看房");
    }

}
