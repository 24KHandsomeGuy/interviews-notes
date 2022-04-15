package com.bibabo.GOF23.bridgeAdapter;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 14:30
 * @description
 */
public class MysqlConnection extends Connection {

    public MysqlConnection(Driver driver) {
        super(driver);
    }

    @Override
    public void closed() {
        System.out.println("closed");
    }

    @Override
    public void commit() {
        System.out.println("commit transaction");
    }

    @Override
    public void connect() {
        driver.connect("mysql://123456");
    }
}
