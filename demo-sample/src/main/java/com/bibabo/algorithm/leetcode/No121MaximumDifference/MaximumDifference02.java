package com.bibabo.algorithm.leetcode.No121MaximumDifference;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 11:14
 * @Description:
 */
public class MaximumDifference02 {

    public int maxProfit(int[] prices) {
        int minPrice = Integer.MAX_VALUE;
        int maxProfit = 0;
        for (int i = 0; i < prices.length; i++) {
            if (prices[i] < minPrice) {
                minPrice = prices[i];
            } else if (prices[i] - minPrice > maxProfit) {
                maxProfit = prices[i] - minPrice;
            }
        }
        return maxProfit;
    }
}
