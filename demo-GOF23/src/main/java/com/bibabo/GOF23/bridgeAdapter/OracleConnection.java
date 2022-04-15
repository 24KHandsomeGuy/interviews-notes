package com.bibabo.GOF23.bridgeAdapter;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 14:30
 * @description
 */
public class OracleConnection extends Connection {

    public OracleConnection(Driver driver) {
        super(driver);
    }

    @Override
    public void closed() {
        System.out.println("OracleConnection closed");
    }

    @Override
    public void commit() {
        System.out.println("OracleConnection commit transaction");
    }

    @Override
    public void connect() {
        driver.connect("oracle://123456");
    }
}
