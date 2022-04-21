package com.bibabo.zookeeper.curator;

import java.util.Random;

/**
 * @author fukuixiang
 * @date 2021/12/16
 * @time 10:08
 * @description
 */
public class CuratorConnectRetryPolicyTest {

    public static void main(String[] args) {

        System.out.println(1000 * Math.max(1, new Random().nextInt(1 << 5 + 1)));
        System.out.println(1000 * Math.max(1, new Random().nextInt(1 << 4 + 1)));
        System.out.println(1000 * Math.max(1, new Random().nextInt(1 << 3 + 1)));
        System.out.println(1000 * Math.max(1, new Random().nextInt(1 << 2 + 1)));
        System.out.println(1000 * Math.max(1, new Random().nextInt(1 << 1 + 1)));
    }
}
