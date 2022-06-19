package com.bibabo.io.java.nio;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/19 19:41
 * @Description: NIO模式 非多路复用示例
 * 核心：channel、buffer、selector
 * 1.等待连接可以设置为非阻塞的
 * 2.等待IO准备就绪可以设置为非阻塞的
 * 缺点：需要不断轮询，消耗CPU资源
 */
public class NioServerSocket {

    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();

    public static void main(String[] args) throws IOException, InterruptedException {
        ServerSocketChannel serverSocketChannel = ServerSocketChannel.open();
        serverSocketChannel.configureBlocking(false);// 设置连接为非阻塞
        serverSocketChannel.socket().bind(new InetSocketAddress(9090));

        // 单独一个线程轮询IO准备就绪
        NioSocketThread ioWorkThread = new NioSocketThread("nio-work-thread");
        EXECUTOR.submit(ioWorkThread);
        while (!Thread.currentThread().isInterrupted()) {
            // todo 是非阻塞的，没有连接也不会阻塞，进入到下一次循环
            SocketChannel socketChannel = serverSocketChannel.accept();
            if (socketChannel != null) {
                System.out.println("服务端接收客户端请求连接地址：" + socketChannel.getRemoteAddress().toString());
                ioWorkThread.addChannel(socketChannel);
            } else {
                Thread.sleep(2000);
                System.out.println("未有连接就绪");
            }
        }
    }
}
