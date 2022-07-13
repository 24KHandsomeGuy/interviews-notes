package com.bibabo.algorithm.loadbalance;


import java.util.List;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/11 9:59
 * @Description:
 */
public abstract class AbstractLoadBalance<T> implements LoadBalance<List<T>, T> {

    @Override
    public T select(List<T> elements) {
        if (elements == null || elements.size() == 0) {
            return null;
        }
        if (elements.size() == 1) {
            return elements.get(0);
        }

        return doSelect(elements);
    }

    protected abstract T doSelect(List<T> elements);

}
