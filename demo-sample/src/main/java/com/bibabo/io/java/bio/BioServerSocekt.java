package com.bibabo.io.java.bio;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/19 18:03
 * @Description: 传统BIO
 * 1.等待连接是阻塞的
 * 2.等待IO准备就绪是阻塞的
 * 所有请求都需要串行化
 */
public class BioServerSocekt {

    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(9090);
        System.out.println("启动端口9090");
        Socket socket = null;
        while (!Thread.currentThread().isInterrupted()) {
            // todo 阻塞等待监听连接
            socket = serverSocket.accept();
            System.out.println("接收客户端连接端口：" + socket.getPort());
            // while (!socket.isClosed()) { // 希望连接可以持续交互
                // todo 阻塞等待socket输入
                InputStream inputStream = socket.getInputStream();
                InputStreamReader reader = new InputStreamReader(inputStream, "UTF-8");
                BufferedReader bufferedReader = new BufferedReader(reader);
                String clientStr = bufferedReader.readLine();
                System.out.println("接收客户端请求消息：" + clientStr);

                BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
                bufferedWriter.write("server has receive your request: " + clientStr + "\n");
                bufferedWriter.flush();
            // }
        }

        if (socket != null) {
            socket.close();
        }
        serverSocket.close();
    }
}
