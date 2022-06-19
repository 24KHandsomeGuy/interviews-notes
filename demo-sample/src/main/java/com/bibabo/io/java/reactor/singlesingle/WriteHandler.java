package com.bibabo.io.java.reactor.singlesingle;

import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.SocketChannel;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/19 21:11
 * @Description:
 */
public class WriteHandler implements Runnable {

    Selector selector;
    SocketChannel socketChannel;

    public WriteHandler(Selector selector, SocketChannel socketChannel) {
        this.selector = selector;
        this.socketChannel = socketChannel;
    }

    @Override
    public void run() {
        try {
            /*ByteBuffer byteBuffer = ByteBuffer.allocate(1024);
            socketChannel.read(byteBuffer);
            System.out.println("Server receive msg :" + new String(byteBuffer.array()));
            socketChannel.register(selector, SelectionKey.OP_WRITE, new WriteHandler());*/
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
