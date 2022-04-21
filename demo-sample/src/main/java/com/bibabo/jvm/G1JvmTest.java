package com.bibabo.jvm;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2022/3/16
 * @time 10:13
 * @description
 */
public class G1JvmTest {

    public static void main(String[] args) throws InterruptedException {

        short i = 0;
        List<Foo> fooList = new ArrayList<>();
        do {
            Foo foo = new Foo();
            foo.setId(i);
            fooList.add(foo);
            System.out.println(i ++);
        } while (i < Integer.MAX_VALUE);

    }
}
