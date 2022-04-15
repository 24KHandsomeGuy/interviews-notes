package com.bibabo.GOF23.command;

/**
 * @author fukuixiang
 * @date 2020/9/3
 * @time 12:51
 * @description
 */
public class CommandWaiter {

    private Breakfast bread;
    private Breakfast dumplings;

    public void setBread(Breakfast bread) {
        this.bread = bread;
    }

    public void setDumplings(Breakfast dumplings) {
        this.dumplings = dumplings;
    }

    void orderBread() {
        bread.cook();
    }

    void orderDumplings() {
        dumplings.cook();
    }

}
