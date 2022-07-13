package com.bibabo.algorithm.loadbalance.roundrobin;

import com.bibabo.algorithm.loadbalance.AbstractLoadBalance;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/11 11:00
 * @Description: 2, 3, 5
 */
public class WeightRoundRobinLoadBalance extends AbstractLoadBalance<WeightRoundRobinLoadBalance.WeightRoundRobin> {

    private static final AtomicInteger index = new AtomicInteger();

    @Override
    protected WeightRoundRobin doSelect(List<WeightRoundRobin> elements) {
        int totalWeight = 0;
        for (WeightRoundRobin element : elements) {
            totalWeight += element.getWeight();
        }
        int currentIndex = index.getAndIncrement() % totalWeight;
        for (WeightRoundRobin element : elements) {
            if (element.getWeight() > currentIndex) {
                return element;
            }
            currentIndex -= element.getWeight();
        }

        return null;
    }


    public static class WeightRoundRobin<T> {

        private T element;

        private int weight;

        public WeightRoundRobin(T element, int weight) {
            this.element = element;
            this.weight = weight;
        }

        public T getElement() {
            return element;
        }

        public void setElement(T element) {
            this.element = element;
        }

        public int getWeight() {
            return weight;
        }

        public void setWeight(int weight) {
            this.weight = weight;
        }
    }
}
