package com.bibabo.string;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/7 16:42
 * @Description
 */
public class SubZeroTest {

    public static void main(String[] args) {
        String str = "000100";
        System.out.println(Integer.parseInt(str));

        String newStr = str.replaceAll("^(0+)", "");
        System.out.println(Integer.parseInt(newStr));
    }
}
