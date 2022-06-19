package com.bibabo.io.java.bio;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/19 19:30
 * @Description:
 */
public class BioSocketThread implements Runnable {

    Socket socket;

    public BioSocketThread(Socket socket) {
        this.socket = socket;
    }

    @Override
    public void run() {
        try {
            while (!socket.isClosed()) {
                // todo 阻塞等待socket输入
                InputStream inputStream = socket.getInputStream();
                InputStreamReader reader = new InputStreamReader(inputStream, "UTF-8");
                BufferedReader bufferedReader = new BufferedReader(reader);
                String clientStr = bufferedReader.readLine();
                System.out.println("Thread name" + Thread.currentThread().getName() + "接收客户端请求消息：" + clientStr);
                BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
                bufferedWriter.write("server has receive your request: " + clientStr + "\n");
                bufferedWriter.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (socket != null) {
                try {
                    socket.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
