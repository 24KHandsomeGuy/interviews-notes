package com.bibabo.GOF23.commandcomposite;

import GOF23.command.CommandWaiter;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2020/9/3
 * @time 13:10
 * @description
 */
public class CompositeWaiter implements CompositeBreakFast {

    List<CompositeBreakFast> compositeBreakFasts = new ArrayList<CompositeBreakFast>();

    public void cook() {
        for (CompositeBreakFast c : compositeBreakFasts) {
            c.cook();
        }
    }

    public void add(CompositeBreakFast compositeBreakFast) {
        compositeBreakFasts.add(compositeBreakFast);
    }

}
