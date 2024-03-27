package com.bibabo.javabase;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/1/4 18:25
 * @Description:
 */
public class WrapperClassTest {

    public static void main(String[] args) {

        /*System.out.println(65537 & ((1 << 16) - 1));

        System.out.println(65536 >>> 16);

        System.out.println(1 << 16);

        System.out.println((65535 + 65536 + 65536) >>> 16);*/

        Short s1 = 43;
        Short s2 = 43;
        System.out.println(s1 == s2);

        Short s3 = new Short((short) 43);
        Short s4 = 43;
        System.out.println(s3 == s4);

        Integer i1 = 43;
        Integer i2 = 43;
        System.out.println(i1 == i2);

        Integer i3 = 150;
        Integer i4 = 150;
        System.out.println(i4 == i3);
    }
}
