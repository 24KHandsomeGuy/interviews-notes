package com.bibabo.GOF23.flyweight.connection;

import com.bibabo.GOF23.bridgeAdapter.Connection;
import com.bibabo.GOF23.bridgeAdapter.Driver;

import java.util.concurrent.atomic.AtomicBoolean;

/**
 * @author fukuixiang
 * @date 2021/2/25
 * @time 10:37
 * @description
 */
public class ConnectionWrapper extends Connection {

    /**
     * 委派
     */
    private Connection delegateConnection;

    /**
     * 连接是否可用
     */
    private AtomicBoolean available;

    /**
     * 连接的名字
     */
    private String name;

    public ConnectionWrapper(Connection delegateConnection, String name) {
        super(null);
        this.delegateConnection = delegateConnection;
        this.name = name;
    }

    public AtomicBoolean getAvailable() {
        return available;
    }

    public void setAvailable(AtomicBoolean available) {
        this.available = available;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public void closed() {
        delegateConnection.closed();
    }

    @Override
    public void commit() {
        delegateConnection.commit();
    }

    @Override
    public void connect() {
        delegateConnection.connect();
    }

}
