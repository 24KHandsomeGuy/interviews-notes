package com.bibabo.algorithm.loadbalance.random;

import com.bibabo.algorithm.loadbalance.AbstractLoadBalance;

import java.util.List;
import java.util.Random;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/11 14:52
 * @Description:
 */
public class WeightRandomLoadBalance extends AbstractLoadBalance<WeightRandomLoadBalance.WeightRandom> {


    @Override
    protected WeightRandom doSelect(List<WeightRandom> elements) {
        int totalWeight = 0;
        for (WeightRandom element : elements) {
            totalWeight += element.getWeight();
        }
        int random = new Random().nextInt(totalWeight);
        for (WeightRandom element : elements) {
            if (element.getWeight() > random) {
                return element;
            }
            random -= element.getWeight();
        }
        return null;
    }

    public static class WeightRandom<T> {

        private T element;

        private int weight;

        public WeightRandom(T element, int weight) {
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
