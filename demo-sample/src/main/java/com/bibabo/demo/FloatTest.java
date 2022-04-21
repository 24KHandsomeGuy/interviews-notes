package com.bibabo.demo;

import java.math.BigDecimal;

/**
 * @author fukuixiang
 * @date 2020/11/26
 * @time 10:15
 * @description
 */
public class FloatTest {

    public static void main(String[] args) {

        /*float f = 0.75f;
        float f2 = 0.75f;
        System.out.println(f == f2);//true*/

        /*float f = 0.8f - 0.7f;
        float f2 = 0.9f - 0.8f;
        System.out.println(f == f2);//false 这就有问题了 预期的值是true 由于float类型无法用二进制存储 采用的是科学计数法的形式存储的 会存在误差*/

        //一.
        /*float f = 0.8f - 0.7f;
        float f2 = 0.9f - 0.8f;
        System.out.println(f - f2);//-5.9604645E-8  5*10^(-8) 5乘10的负8次方
        Float ff = Float.valueOf(f);
        Float ff2 = Float.valueOf(f2);
        System.out.println(ff.equals(ff2));//false 同上 也有问题*/

        /*//正确比较方式 1.指定一个误差范围，两个浮点数的差值在此范围之内，则认为是相等的
        float f = 0.8f - 0.7f;
        float f2 = 0.9f - 0.8f;
        //float diff = 1e - 6f; //1乘10的负6次方
        float diff = 0.000001f;
        if (Math.abs(f - f2) < diff) {
            System.out.println(true);
            return;
        }
        System.out.println(false);*/

        /*//正确比较方式 2.BigDecimal
        BigDecimal bigDecimal = new BigDecimal("0.9");
        BigDecimal bigDecimal2 = new BigDecimal("0.8");
        BigDecimal bigDecimal3 = new BigDecimal("0.7");

        BigDecimal f = bigDecimal.subtract(bigDecimal2);
        BigDecimal f2 = bigDecimal2.subtract(bigDecimal3);

        System.out.println(f.equals(f2));//true*/

        //二.
        /*//切勿直接把float 或 double 通过构造创建BigDecimal 0.1000000000000000055511151231257827021181583404541015625
        BigDecimal decimal = new BigDecimal(0.1);
        //BigDecimal decimal = new BigDecimal(0.1f);
        //System.out.println(decimal.doubleValue());
        //System.out.println(decimal.floatValue());
        BigDecimal bigDecimal = new BigDecimal("0.9");
        BigDecimal bigDecimal2 = new BigDecimal("0.8");
        BigDecimal bigDecimal3 = bigDecimal.subtract(bigDecimal2);
        System.out.println(bigDecimal3);//0.1
        System.out.println(decimal);//0.1000000000000000055511151231257827021181583404541015625
        System.out.println(bigDecimal3.equals(decimal));//false*/

        /*//正确方式 1.可以使用String构造 float double问题皆可解决
        BigDecimal decimal = new BigDecimal(String.valueOf(0.1));
        //BigDecimal decimal = new BigDecimal(String.valueOf(0.1f));
        BigDecimal bigDecimal = new BigDecimal("0.9");
        BigDecimal bigDecimal2 = new BigDecimal("0.8");
        BigDecimal bigDecimal3 = bigDecimal.subtract(bigDecimal2);
        System.out.println(bigDecimal3);//0.1
        System.out.println(decimal);//0.1
        System.out.println(bigDecimal3.equals(decimal));//true*/

        /*//正确方式 2.可以使用BigDecimal.valueOf() 如果是double 类型 结果是正确的   但是构造传入float类型 还是有问题
        BigDecimal decimal = BigDecimal.valueOf(0.1);
        BigDecimal bigDecimal = new BigDecimal("0.9");
        BigDecimal bigDecimal2 = new BigDecimal("0.8");
        BigDecimal bigDecimal3 = bigDecimal.subtract(bigDecimal2);
        System.out.println(bigDecimal3);//0.1
        System.out.println(decimal);//0.1
        System.out.println(bigDecimal3.equals(decimal));//true*/

        //正确方式 2.可以使用BigDecimal.valueOf() 如果是double 类型 结果是正确的   但是构造传入float类型 还是有问题
        BigDecimal decimal = BigDecimal.valueOf(0.1f);
        BigDecimal bigDecimal = new BigDecimal("0.9");
        BigDecimal bigDecimal2 = new BigDecimal("0.8");
        BigDecimal bigDecimal3 = bigDecimal.subtract(bigDecimal2);
        System.out.println(bigDecimal3);//0.1
        System.out.println(decimal);//10000000149011612
        System.out.println(bigDecimal3.equals(decimal));//false

        //String s = "a,b,c,,"; //length 3
        String s = "a,b,c,,a";//length 5
        String[] split = s.split(",");
        for (String s1 : split) {
            System.out.println(s1);
        }
        System.out.println(split.length);

    }

}
