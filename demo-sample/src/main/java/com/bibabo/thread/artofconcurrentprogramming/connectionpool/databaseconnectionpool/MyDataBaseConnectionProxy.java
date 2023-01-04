package com.bibabo.thread.artofconcurrentprogramming.connectionpool.databaseconnectionpool;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.concurrent.TimeUnit;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/10 12:19
 * @Description:
 * 动态代理com.sql.Connection
 * commit()方法睡眠100毫秒，模拟提交sql
 */
public class MyDataBaseConnectionProxy implements InvocationHandler {
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        if (method.getName().equals("commit")) {
            System.out.println("MyDataBaseConnectionProxy commit the sql to database.");
            TimeUnit.MILLISECONDS.sleep(100);
        }
        return null;
    }
}
