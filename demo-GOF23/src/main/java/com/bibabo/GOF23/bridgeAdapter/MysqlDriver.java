package com.bibabo.GOF23.bridgeAdapter;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 14:29
 * @description
 */
public class MysqlDriver implements Driver {

    private volatile static MysqlDriver mysqlDriver;

    // 1.构造器私有化
    private MysqlDriver() {
    }

    @Override
    public void connect(String url) {
        System.out.println("连接到" + url);
    }

    // 2.对外部提供获取单个实例的接口
    public static Driver getMysqlDriver() {
        if (mysqlDriver == null) {
            synchronized (MysqlDriver.class) {
                if (mysqlDriver == null) {
                    mysqlDriver = new MysqlDriver();
                }
            }
        }
        return mysqlDriver;
    }
}
