package com.bibabo.algorithm.loadbalance;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/11 18:58
 * @Description:
 */
public interface LoadBalance<T, R> {

    R select(T t);
}
