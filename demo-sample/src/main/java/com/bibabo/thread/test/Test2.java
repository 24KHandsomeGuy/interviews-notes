package com.bibabo.thread.test;

import lombok.Data;
import lombok.SneakyThrows;

/**
 * @author fukuixiang
 * @date 2021/4/20
 * @time 17:51
 * @description
 */
public class Test2 {

    @SneakyThrows
    public static void main(String[] args) {
        Order order = new Order();
        run(order);
        System.out.println("orderId" + order.getOrderId());
    }

    @Data
    public static class Order {
        Integer orderId;
    }

    /**
     * 你想要的一个Integer类型的返回值 比如订单id
     */
    private static void run (Order order) {
        order.setOrderId(10086);
    }

}
