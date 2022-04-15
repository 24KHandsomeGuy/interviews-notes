package com.bibabo.GOF23.bridgeAdapter;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 14:28
 * @description 抽象化角色
 */
public abstract class Connection {

    // 桥接
    Driver driver;

    // 享元模式中的享元对象内部状态
    int ip;
    int port;

    public Connection(Driver driver) {
        this.driver = driver;
    }

    public void setDriver(Driver driver) {
        this.driver = driver;
    }

    public abstract void closed();

    public abstract void commit();

    public abstract void connect();

}
