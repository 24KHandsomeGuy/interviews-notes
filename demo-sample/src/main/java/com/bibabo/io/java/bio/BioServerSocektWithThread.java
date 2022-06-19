package com.bibabo.io.java.bio;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/19 18:03
 * @Description:
 * 1.等待连接是阻塞的
 * 2.等待IO准备就绪是通过线程来异步等待的
 * 2已经是通过将任务丢到线程池执行来做到异步阻塞，也就是不会阻塞主线程。但是线程池的大小取决于CPU资源，这种处理方式受CPU限制，很有局限性
 *
 * 这种模型也会有使用场景，对连接数要求不高的场景
 * 比如Nacos的注册地址信息同步的通信、Zookeeper的Leader选举
 */
public class BioServerSocektWithThread {

    private static final ExecutorService EXECUTOR = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors());

    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(9090);
        System.out.println("启动端口9090");
        while (!Thread.currentThread().isInterrupted()) {
            // todo 阻塞等待监听连接
            Socket socket = serverSocket.accept();
            System.out.println("接收客户端连接端口：" + socket.getPort());
            EXECUTOR.submit(new BioSocketThread(socket));
        }

        serverSocket.close();
    }
}
