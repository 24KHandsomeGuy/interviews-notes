package com.bibabo.redis.jedis;

/**
 * @author fukuixiang
 * @date 2021/4/19
 * @time 13:53
 * @description
 *
 * redis的五种数据类型
 * String int、float、string
 */
public class JedisTest {

    public static void main(String[] args) {

        //MyJedisUtil.getJedis().set("111", "111");
        // System.out.println(MyJedisUtil.getJedis().get("DEMO_FILTER_1"));;

        System.out.println(MyJedisUtil.getJedis().set("HAHADEMO_FILTER    _1", 1 + ""));;
    }

}
