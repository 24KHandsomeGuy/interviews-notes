package com.bibabo.algorithm.loadbalance.roundrobin;

import com.bibabo.algorithm.loadbalance.AbstractLoadBalance;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/11 10:03
 * @Description:
 */
public class SimpleRoundRobinLoadBalance<T> extends AbstractLoadBalance<T> {

    private final AtomicInteger index = new AtomicInteger();

    @Override
    protected T doSelect(List<T> elements) {
        return elements.get(index.getAndIncrement() % elements.size());
    }
}
