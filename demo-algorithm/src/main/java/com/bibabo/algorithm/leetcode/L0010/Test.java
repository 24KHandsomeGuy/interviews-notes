package com.bibabo.algorithm.leetcode.L0010;

/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/3 10:13
 * @Description:
 */
public class Test {

    public static void main(String[] args) {
        String s = "abbb";
        String p = "a*";
        System.out.println(isMatch(s, p));
    }

    /**
     * s:a p:a
     * s:aaa p:a*
     *
     * @param s
     * @param p
     * @return
     */
    public static boolean isMatch(String s, String p) {
        int m = s.length();
        int n = p.length();

        boolean[][] f = new boolean[m + 1][n + 1];
        // 两个空字符串是允许匹配的
        f[0][0] = true;
        for (int i = 0; i <= m; ++i) {
            for (int j = 1; j <= n; ++j) {
                if (p.charAt(j - 1) == '*') {
                    // *的前一个先忽略，前前那些是否匹配
                    f[i][j] = f[i][j - 2];
                    // 参数传的j - 1，也就是 *的前一个
                    if (matches(s, p, i, j - 1)) {
                        // f[i][j]
                        f[i][j] = f[i][j] || f[i - 1][j];
                    }
                } else {
                    // 当前这俩匹配
                    if (matches(s, p, i, j)) {
                        // 和前两个的比对结果进行”与“操作
                        f[i][j] = f[i - 1][j - 1];
                    }
                }
            }
        }
        return f[m][n];
    }

    public static boolean matches(String s, String p, int i, int j) {
        if (i == 0) {
            return false;
        }
        if (p.charAt(j - 1) == '.') {
            return true;
        }
        return s.charAt(i - 1) == p.charAt(j - 1);
    }
}
