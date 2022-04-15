package com.bibabo.GOF23.bridgeAdapter;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 14:29
 * @description
 */
public class OracleDriver implements Driver {

    @Override
    public void connect(String url) {
        System.out.println("OracleDriver 连接到" + url);
    }
}
