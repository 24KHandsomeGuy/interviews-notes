package com.bibabo.thread.artofconcurrentprogramming.connectionpool.databaseconnectionpool;

import lombok.SneakyThrows;

import java.sql.Connection;
import java.util.LinkedList;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/10 12:06
 * @Description:
 */
public class MyDataBaseConnectionPool {

    private LinkedList<Connection> pool = new LinkedList<>();

    public MyDataBaseConnectionPool(int poolSize) {
        if (poolSize > 0) {
            for (int i = 0; i < poolSize; i++) {
                pool.addLast(MyDataBaseConnectionDriver.createConnection());
            }
        }
    }

    @SneakyThrows
    public Connection getConnection(long millis) {
        synchronized (pool) {
            if (millis <= 0) {
                while (pool.isEmpty()) {
                    pool.wait();
                }
                return pool.removeFirst();
            }
            long future = System.currentTimeMillis() + millis;
            long remaining = millis;
            while (pool.isEmpty()) {
                if (remaining <= 0) {
                    return null;
                }
                pool.wait(remaining);
                remaining = future - System.currentTimeMillis();
            }
            return pool.removeFirst();
        }
    }

    public void releaseConncetion(Connection connection) {
        synchronized (pool) {
            pool.addLast(connection);
            pool.notifyAll();
        }
    }
}
