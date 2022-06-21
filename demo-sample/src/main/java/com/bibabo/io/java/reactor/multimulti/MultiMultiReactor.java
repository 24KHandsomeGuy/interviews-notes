package com.bibabo.io.java.reactor.multimulti;

import java.io.IOException;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/20 22:07
 * @Description: 多线程多Reactor模型
 * Acceptor接收连接器监听端口。MainReactor.select连接，就绪连接交由Acceptor来处理，Acceptor处理后，将读写Handler注册到多线程个SubReactor上
 * SubReactor如果发现有读写事件准备就绪，处理Handler
 */
public class MultiMultiReactor {

    private int port;

    // 负责接收连接
    private Reactor mainReactor;

    Executor executor = Executors.newSingleThreadExecutor();

    public MultiMultiReactor(int port) throws IOException {
        this.port = port;
        mainReactor = new Reactor();
    }

    public void start() throws IOException {
        new Acceptor(mainReactor.getSelector(), port);
        executor.execute(mainReactor);
    }

    public static void main(String[] args) throws IOException {
        new MultiMultiReactor(9090).start();
    }
}
