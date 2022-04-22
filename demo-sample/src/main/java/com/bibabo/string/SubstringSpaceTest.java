package com.bibabo.string;

/**
 * @author fukuixiang
 * @date 2022/4/21
 * @time 10:51
 * @description 截取空格测试
 */
public class SubstringSpaceTest {

    public static void main(String[] args) {

        String s = "abc efg";

        int spaceIdx = s.indexOf(" ");
        System.out.println(spaceIdx);
        System.out.println(s.substring(0, spaceIdx));
    }
}
