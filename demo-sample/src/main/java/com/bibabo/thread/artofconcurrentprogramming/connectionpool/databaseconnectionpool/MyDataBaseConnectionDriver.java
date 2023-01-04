package com.bibabo.thread.artofconcurrentprogramming.connectionpool.databaseconnectionpool;

import java.lang.reflect.Proxy;
import java.sql.Connection;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/10 12:18
 * @Description: 创建动态代理com.sql.Connection
 */
public class MyDataBaseConnectionDriver {

    public static Connection createConnection() {
        return (Connection) Proxy.newProxyInstance(MyDataBaseConnectionDriver.class.getClassLoader(), new Class[]{Connection.class}, new MyDataBaseConnectionProxy());
    }
}
