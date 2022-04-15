package com.bibabo.GOF23.bridgeAdapter;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 14:30
 * @description
 */
public class MysqlConnection2 extends Connection {

    public MysqlConnection2(Driver driver) {
        super(driver);
    }

    @Override
    public void closed() {
        System.out.println("closed2");
    }

    @Override
    public void commit() {
        System.out.println("commit2 transaction");
    }

    @Override
    public void connect() {
        driver.connect("mysql2://123456");
    }
}
