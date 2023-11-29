package com.bibabo.reflect;

import java.lang.reflect.Field;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/27 18:43
 * @Description
 */
public class ReflectThreadPoolParamTest {

    private static ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 1, 0, TimeUnit.SECONDS, new LinkedBlockingQueue<>());

    public static void main(String[] args) throws NoSuchFieldException, IllegalAccessException {
        Field field = ReflectThreadPoolParamTest.class.getDeclaredField("threadPoolExecutor");
        ThreadPoolExecutor threadPoolExecutor = (ThreadPoolExecutor) field.get(null);
        System.out.println(threadPoolExecutor);
    }
}
