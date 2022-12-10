package com.bibabo.GOF23.command;

import com.bibabo.GOF23.commandcomposite.CompositeBreakFast;

/**
 * @author fukuixiang
 * @date 2020/9/3
 * @time 12:47
 * @description
 */
public class Bread implements CompositeBreakFast {

    Cheif cheif = new BreadCheief();

    public void cook() {
        cheif.cooking();
    }


}
