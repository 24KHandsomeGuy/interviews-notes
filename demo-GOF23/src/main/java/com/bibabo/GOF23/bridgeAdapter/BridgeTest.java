package com.bibabo.GOF23.bridgeAdapter;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 14:38
 * @description
 */
public class BridgeTest {

    public static void main(String[] args) {

        // 创建实现化角色
        Driver driver = MysqlDriver.getMysqlDriver();

        // 创建抽象化角色
        Connection connection = new MysqlConnection(driver);
        connection.connect();

        connection.commit();
        connection.closed();

        // 创建抽象化角色2
        Connection connection2 = new MysqlConnection2(driver);
        connection2.connect();

        // 创建实现化角色2
        Driver driver2 = new OracleDriver();
        Connection connection3 = new OracleConnection(driver2);
        connection3.connect();
        connection3.commit();
        connection3.closed();
    }

}
