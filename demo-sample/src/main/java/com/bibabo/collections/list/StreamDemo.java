package com.bibabo.collections.list;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

/**
 * @author fukuixiang
 * @date 2021/3/10
 * @time 16:08
 * @description
 */
public class StreamDemo {

    public static void main(String[] args) {

        List<Integer> lis = Arrays.asList(1,2,3,4,5,6,7,8,9);
        Stream<Integer> stream1 = lis.stream().map(i -> i+1);  //中间操作
        Stream<Integer> stream2 = stream1.filter(i -> i > 0);  //中间操作
        Stream<Integer> stream3 = stream2.limit(10);  //中间操作
        Stream<Integer> stream4 = stream3.distinct(); //中间操作

        //Optional<Integer> result1 = stream4.findAny(); //终止操作
        //Optional<Integer> result2 = stream4.findFirst(); //终止操作，两次调用终止操作，会抛异常,流只能被使用一次，可以中间操作，也可以是终止操作
        stream4.forEach(i -> System.out.print(i));  //终止操作，没有返回值

        //上面的所有操作有另外的一种写法
        lis.stream().map(i -> i+1).filter(i -> i > 0)
                .limit(10).distinct().forEach(i -> System.out.println(i));


        lis.forEach(System.out::println);

        Stream.of(1,2,3,4,7,8,9).forEach(System.out::println);
    }

}
