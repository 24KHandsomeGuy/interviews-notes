package com.bibabo.io.java.reactor.multisingle;

import java.nio.ByteBuffer;
import java.nio.channels.Selector;
import java.nio.channels.SocketChannel;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/19 21:11
 * @Description:
 */
public class MultiReadHandler implements Runnable {

    Selector selector;
    SocketChannel socketChannel;

    private ExecutorService executorService = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors());

    public MultiReadHandler(Selector selector, SocketChannel socketChannel) {
        this.selector = selector;
        this.socketChannel = socketChannel;
    }

    @Override
    public void run() {
        executorService.execute(new ReadHandlerRunner(socketChannel));
    }

    static class ReadHandlerRunner implements Runnable {
        SocketChannel socketChannel;

        public ReadHandlerRunner(SocketChannel socketChannel) {
            this.socketChannel = socketChannel;
        }

        @Override
        public void run() {
            try {
                ByteBuffer byteBuffer = ByteBuffer.allocate(1024);
                socketChannel.read(byteBuffer);
                System.out.println("Thread:" + Thread.currentThread().getName() + ",Server receive msg :" + new String(byteBuffer.array()));
                // socketChannel.register(selector, SelectionKey.OP_WRITE, new WriteHandler(selector, socketChannel));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
