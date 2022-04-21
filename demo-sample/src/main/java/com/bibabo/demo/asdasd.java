package com.bibabo.demo;

/**
 * @author fukuixiang
 * @date 2021/5/10
 * @time 9:52
 * @description
 */
public class asdasd {


    public static void main(String[] args) {
        int n = 15;
        print(n);
    }

    static void print(int n) {
        for (int i = 1; i <= n / 2 + 1; i++) {
            int m = 0, k = 0;
            int sum = 0;
            for (int j = i; j <= n / 2 + 1; j++) {
                sum += j;
                if (sum == n) {
                    m = j;
                    k = i;
                    break;
                }
                if (sum > n) break;
            }
            if (m > 0) {
                for (int p = k; p <= m; p++) {
                    System.out.print(p);
                    if (p == m) {
                        System.out.println("=" + n);
                    } else {
                        System.out.print("+");
                    }
                }
            }
        }
    }
}
