package com.bibabo.io.java.reactor.singlesingle;

import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/19 21:06
 * @Description:
 */
public class Acceptor implements Runnable {

    Selector selector;
    ServerSocketChannel serverSocketChannel;

    public Acceptor(Selector selector, ServerSocketChannel serverSocketChannel) {
        this.selector = selector;
        this.serverSocketChannel = serverSocketChannel;
    }

    @Override
    public void run() {
        try {
            // 此时一定会拿到连接
            SocketChannel socketChannel = serverSocketChannel.accept();
            System.out.println("服务端接收到连接" + socketChannel.getRemoteAddress().toString());
            socketChannel.configureBlocking(false);
            // 读处理
            socketChannel.register(selector, SelectionKey.OP_READ, new ReadHandler(selector, socketChannel));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
