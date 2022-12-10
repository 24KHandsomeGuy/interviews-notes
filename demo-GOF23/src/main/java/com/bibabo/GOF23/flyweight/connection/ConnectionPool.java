package com.bibabo.GOF23.flyweight.connection;

import com.bibabo.GOF23.bridgeAdapter.Connection;
import com.bibabo.GOF23.bridgeAdapter.Driver;
import com.bibabo.GOF23.bridgeAdapter.MysqlConnection;
import com.bibabo.GOF23.bridgeAdapter.MysqlConnection2;
import com.bibabo.GOF23.bridgeAdapter.MysqlDriver;
import com.bibabo.GOF23.bridgeAdapter.OracleConnection;
import com.bibabo.GOF23.bridgeAdapter.OracleDriver;
import com.bibabo.GOF23.bridgeAdapter.PostgreSqlConnection;
import com.bibabo.GOF23.bridgeAdapter.PostgresqlAdapterDriver;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author fukuixiang
 * @date 2021/2/25
 * @time 10:24
 * @description 数据库连接池 享元工厂 存储共享连接 Connection使用的是桥接模式中的
 */
public class ConnectionPool {

    // 数据库连接映射
    private static final Map<String, Class> connectionMapping = new HashMap<>();
    // 数据库驱动映射
    private static final Map<String, Driver> driverMapping = new HashMap<>();
    // 数据库与连接个数的映射
    private static final Map<String, AtomicInteger> atomicIntegerMap = new HashMap<>();

    private static Lock lock = new ReentrantLock();

    static {
        connectionMapping.put("mysql", MysqlConnection.class);
        connectionMapping.put("mysql2", MysqlConnection2.class);
        connectionMapping.put("PostgreSql", PostgreSqlConnection.class);
        connectionMapping.put("oracle", OracleConnection.class);

        driverMapping.put("mysql", MysqlDriver.getMysqlDriver());
        driverMapping.put("mysql2", MysqlDriver.getMysqlDriver());
        driverMapping.put("PostgreSql", new OracleDriver());
        driverMapping.put("oracle", new PostgresqlAdapterDriver());

        atomicIntegerMap.put("mysql", new AtomicInteger(0));
        atomicIntegerMap.put("mysql2", new AtomicInteger(0));
        atomicIntegerMap.put("PostgreSql", new AtomicInteger(0));
        atomicIntegerMap.put("oracle", new AtomicInteger(0));
    }

    /**
     * key：数据库产商 value：ConnectionWrapper享元集合
     */
    private static final Map<String, List<ConnectionWrapper>> cacheMap = new ConcurrentHashMap<>();

    private static final int SIZE = 10;


    public static Connection getConnection(String databaseName) throws IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException {
        if (!connectionMapping.containsKey(databaseName)) {
            throw new RuntimeException("不存在" + databaseName + "的数据库驱动");
        }

        // 没有当前数据库 享元集合 需要创建
        if (!cacheMap.containsKey(databaseName)) {
            List<ConnectionWrapper> connections = new ArrayList<>(SIZE);
            cacheMap.put(databaseName, connections);
        }
        List<ConnectionWrapper> list = cacheMap.get(databaseName);
        // 享元集合大小 没有满的时候 需要创建连接并且返回
        // FIXME 这里使用list.size()的时候 多线程情况下 无法保证可见性 还是会出现并发问题
        // 要使用双重检查锁 做并发控制
        if (atomicIntegerMap.get(databaseName).get() < SIZE) {
            synchronized (ConnectionPool.class) {
                if (atomicIntegerMap.get(databaseName).get() < SIZE) {
                    Class clazz = connectionMapping.get(databaseName);
                    Constructor<Connection> constructor = clazz.getDeclaredConstructor(Driver.class);
                    Driver driver = driverMapping.get(databaseName);
                    Connection conn = constructor.newInstance(driver);
                    ConnectionWrapper wrapper = new ConnectionWrapper(conn, databaseName + ":" + atomicIntegerMap.get(databaseName).getAndIncrement());
                    wrapper.setAvailable(new AtomicBoolean(false));
                    list.add(wrapper);
                    System.out.println("可用的连接：" + wrapper.getName() + "已成功创建 并且返回");
                    return wrapper;
                }
            }
        }

        // 这地方不需要锁 直接用CAS来控制并发
        for (ConnectionWrapper connWrapper : list) {
            // 如果当前是可用的 并且成功替换为不可用 那么返回当前连接
            if (connWrapper.getAvailable().compareAndSet(true, false)) {
                System.out.println("可用的连接：" + connWrapper.getName() + "已设置不可用 并且成功返回");
                return connWrapper;
            }
        }
        // 都不可用要提示一下 或者放入队列排队 这里先抛异常提示一下
        throw new RuntimeException("连接已用光 请稍后再试");

    }

    public static void release(Connection conn) {
        ConnectionWrapper wrapper = (ConnectionWrapper) conn;
        System.out.println("连接" + wrapper.getName() + "已释放");
        wrapper.getAvailable().compareAndSet(false, true);
    }
}
