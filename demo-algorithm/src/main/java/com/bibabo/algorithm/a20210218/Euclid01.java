package com.bibabo.algorithm.a20210218;

/**
 * @author fukuixiang
 * @date 2021/2/18
 * @time 11:32
 * @description 欧几里得算法
 * 5 % 3 = 2
 * 3 % 2 = 1
 * 2 % 1 = 0
 * 则1为5与3的最大公约数
 */
public class Euclid01 {

    public static void main(String[] args) {
        int result = gcd(Integer.valueOf(args[0]), Integer.valueOf(args[1]));
        System.out.println(result);
    }

    private static int gcd(int p, int q) {
        if (p < 0 || q < 0) {
            throw new RuntimeException("不可以为负数");
        }
        if (p == q) {
            return p;
        }
        if (p < q) {
            return gcd(q, p);
        }

        if (q == 0) {
            return p;
        }
        int r = p % q;
        return gcd(q, r);
    }

}
