package com.bibabo.io.java.reactor.multimulti;

import lombok.SneakyThrows;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.Optional;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/20 22:14
 * @Description:
 */
public class Acceptor implements Runnable {

    final Selector selector;

    final ServerSocketChannel serverSocketChannel;

    private final int POOL_SIZE = Runtime.getRuntime().availableProcessors();

    private Executor subReactorExecutor = Executors.newFixedThreadPool(POOL_SIZE);

    private Reactor[] subReactors = new Reactor[POOL_SIZE];

    int next = 0;

    public Acceptor(Selector selector, int port) throws IOException {
        this.selector = selector;
        serverSocketChannel = ServerSocketChannel.open();
        serverSocketChannel.socket().bind(new InetSocketAddress(port));
        serverSocketChannel.configureBlocking(false);
        serverSocketChannel.register(selector, SelectionKey.OP_ACCEPT, this);
        init();
        System.out.println("Main Reactor Acceptor: Listening on port :" + port);
    }

    private void init() throws IOException {
        for (int i = 0; i < subReactors.length; i ++) {
            subReactors[i] = new Reactor();
            subReactorExecutor.execute(subReactors[i]);
        }
    }

    @SneakyThrows
    @Override
    public void run() {
        // 负责处理连接事件和IO事件
        SocketChannel socketChannel = serverSocketChannel.accept();
        Optional.ofNullable(socketChannel).ifPresent(socketChannel1 -> {
            try {
                socketChannel1.write(ByteBuffer.wrap("Multiply Reactor Patterm\r\nreactor> ".getBytes()));
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                System.out.println("Thread name :" + Thread.currentThread().getName() + "remote address" + socketChannel1.getRemoteAddress());
            } catch (IOException e) {
                e.printStackTrace();
            }
            Reactor subReactor = subReactors[next];
            subReactor.register(new AsyncHandler(socketChannel1));
            if (++next == subReactors.length) {
                next = 0;
            }
        });
    }
}
