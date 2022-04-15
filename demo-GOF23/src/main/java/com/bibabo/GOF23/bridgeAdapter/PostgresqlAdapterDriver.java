package com.bibabo.GOF23.bridgeAdapter;

/**
 * @author fukuixiang
 * @date 2021/2/23
 * @time 14:50
 * @description 适配器
 */
public class PostgresqlAdapterDriver implements Driver {

    Engine engine;

    public PostgresqlAdapterDriver() {
        this.engine = new PostgreSqlEngine();
    }

    @Override
    public void connect(String url) {
        engine.engine(url);
    }
}
