package com.bibabo.GOF23.bridgeAdapter;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 14:53
 * @description
 */
public class AdapterTest {

    public static void main(String[] args) {

        Driver driver = new PostgresqlAdapterDriver();
        Connection connection = new PostgreSqlConnection(driver);
        connection.connect();
        connection.commit();
        connection.closed();

    }

}
