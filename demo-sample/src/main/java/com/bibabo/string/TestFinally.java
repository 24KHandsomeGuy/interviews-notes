package com.bibabo.string;

import java.util.UUID;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/24 22:13
 * @Description:
 */
public class TestFinally {

    public static void main(String[] args) {
        System.out.println(aa());

        System.out.println(UUID.randomUUID());
    }


    public static String aa () {
        try {
            return "a";
        } finally {
            System.out.println("asss");
            return "b";
        }
    }
}
