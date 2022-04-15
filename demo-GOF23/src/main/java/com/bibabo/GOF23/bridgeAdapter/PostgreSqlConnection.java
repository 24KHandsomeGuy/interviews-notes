package com.bibabo.GOF23.bridgeAdapter;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 14:54
 * @description
 */
public class PostgreSqlConnection extends Connection {

    public PostgreSqlConnection(Driver driver) {
        super(driver);
    }

    @Override
    public void closed() {
        System.out.println("PostgreSqlConnection closed");
    }

    @Override
    public void commit() {
        System.out.println("PostgreSqlConnection commit transanction");
    }

    @Override
    public void connect() {
        driver.connect("postgresql://3330");
    }
}
