package com.bibabo.algorithm.loadbalance.roundrobin;

import com.bibabo.algorithm.loadbalance.AbstractLoadBalance;

import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/11 14:01
 * @Description:
 */
public class SmoothWeightRoundRobinLoadBalance extends AbstractLoadBalance<SmoothWeightRoundRobinLoadBalance.SmoothWeight> {

    private final Lock lock;

    public SmoothWeightRoundRobinLoadBalance() {
        this.lock = new ReentrantLock();
    }

    @Override
    protected SmoothWeight doSelect(List<SmoothWeight> elements) {
        int totalWeight = 0;
        SmoothWeight maxSmoothWeight = null;
        lock.lock();
        try {
            for (SmoothWeight element : elements) {
                totalWeight += element.getWeight();
                element.setCurrentWeight(element.getCurrentWeight() + element.getWeight());

                if (maxSmoothWeight == null || element.getCurrentWeight() > maxSmoothWeight.getCurrentWeight()) {
                    maxSmoothWeight = element;
                }
            }
            maxSmoothWeight.setCurrentWeight(maxSmoothWeight.getCurrentWeight() - totalWeight);
        } catch (RuntimeException e) {

        } finally {
            lock.unlock();
        }

        return maxSmoothWeight;
    }

    public static class SmoothWeight<T> {

        private T element;

        private int weight;

        private int currentWeight;

        public SmoothWeight(T element, int weight) {
            this.element = element;
            this.weight = weight;
            this.currentWeight = 0;
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

        public int getCurrentWeight() {
            return currentWeight;
        }

        public void setCurrentWeight(int currentWeight) {
            this.currentWeight = currentWeight;
        }
    }
}
