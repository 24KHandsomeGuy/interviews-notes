package com.bibabo.GOF23.mediator.single;

/**
 * @author fukuixiang
 * @date 2020/9/7
 * @time 11:20
 * @description
 */
public class MediatorTest {

    public static void main(String[] args) {

        Colleague colleague1 = new Colleague1();
        Colleague colleague2 = new Colleague2();
        Colleague colleague3 = new Colleague3();

        SingleMediator singleMediator = SingleMediator.getSingleMediator();
        singleMediator.register(colleague1);
        singleMediator.register(colleague2);
        singleMediator.register(colleague3);

        colleague1.send();

    }

}
