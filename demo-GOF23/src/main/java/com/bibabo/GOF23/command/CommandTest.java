package com.bibabo.GOF23.command;

/**
 * @author fukuixiang
 * @date 2020/9/3
 * @time 12:58
 * @description
 */
public class CommandTest {

    public static void main(String[] args) {

        Breakfast bread = new Bread();
        Breakfast dumplings = new Dumplings();

        CommandWaiter commandWaiter = new CommandWaiter();
        commandWaiter.setBread(bread);
        commandWaiter.setDumplings(dumplings);

        commandWaiter.orderBread();
        commandWaiter.orderDumplings();

    }

}
