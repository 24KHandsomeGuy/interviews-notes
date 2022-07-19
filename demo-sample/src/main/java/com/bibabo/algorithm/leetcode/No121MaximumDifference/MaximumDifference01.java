package com.bibabo.algorithm.leetcode.No121MaximumDifference;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 11:14
 * @Description:
 */
public class MaximumDifference01 {

    public int maxProfit(int[] prices) {
        int maxProfit = 0;
        for (int i = 0; i < prices.length; i++) {
            for (int j = i + 1; j < prices.length; j++) {
                int profit = prices[j] - prices[i];
                if (profit > maxProfit) {
                    maxProfit = profit;
                }
            }
        }
        return maxProfit;
    }
}
