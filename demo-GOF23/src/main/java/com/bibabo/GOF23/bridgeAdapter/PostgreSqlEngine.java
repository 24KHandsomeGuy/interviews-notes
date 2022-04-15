package com.bibabo.GOF23.bridgeAdapter;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 14:45
 * @description 适配者
 */
public class PostgreSqlEngine implements Engine {

    @Override
    public void engine(String url) {
        System.out.println("引擎方式连接到" + url);
    }
}
