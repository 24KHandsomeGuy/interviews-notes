package com.bibabo.GOF23.commandcomposite;

import com.bibabo.GOF23.command.Bread;
import com.bibabo.GOF23.command.CommandWaiter;
import com.bibabo.GOF23.command.Dumplings;

/**
 * @author fukuixiang
 * @date 2020/9/3
 * @time 13:14
 * @description
 */
public class CompositeCommandTest {

    public static void main(String[] args) {

        Bread bread = new Bread();
        Dumplings dumplings = new Dumplings();

        CompositeWaiter compositeWaiter = new CompositeWaiter();
        compositeWaiter.add(bread);
        compositeWaiter.add(dumplings);

        compositeWaiter.cook();

    }

}
