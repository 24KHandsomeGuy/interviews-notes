package com.bibabo.algorithm.loadbalance.random;

import com.bibabo.algorithm.loadbalance.AbstractLoadBalance;

import java.util.List;
import java.util.Random;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/11 14:43
 * @Description:
 */
public class RandomLoadBalance<T> extends AbstractLoadBalance<T> {


    @Override
    protected T doSelect(List<T> elements) {
        int random = new Random().nextInt(elements.size());
        return elements.get(random);
    }
}
