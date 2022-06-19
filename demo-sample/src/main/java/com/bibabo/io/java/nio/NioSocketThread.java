package com.bibabo.io.java.nio;

import org.apache.commons.collections.CollectionUtils;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.SocketChannel;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/19 19:30
 * @Description:
 */
public class NioSocketThread extends Thread {

    List<SocketChannel> socketChannelList = new CopyOnWriteArrayList<>();

    public NioSocketThread(String name) {
        super(name);
    }

    public void addChannel(SocketChannel socketChannel) {
        socketChannelList.add(socketChannel);
    }

    @Override
    public void run() {
        try {
            while (!Thread.currentThread().isInterrupted()) {
                if (socketChannelList.isEmpty()) {
                    Thread.sleep(500);
                    continue;
                }
                for (Iterator<SocketChannel> iterator = socketChannelList.iterator(); iterator.hasNext(); ) {
                    SocketChannel socketChannel = iterator.next();
                    if (!socketChannel.isConnected()) {
                        System.out.println(socketChannel.getRemoteAddress().toString() + "已经断开连接");
                        iterator.remove();
                        continue;
                    }
                    // 用户空间缓冲区
                    ByteBuffer byteBuffer = ByteBuffer.allocate(1024);
                    // todo 设置io非阻塞
                    socketChannel.configureBlocking(false);
                    int i = socketChannel.read(byteBuffer);
                    if (i > 0) {
                        System.out.println(socketChannel.getRemoteAddress().toString() + ".接收客户端消息：" + new String(byteBuffer.array()));
                        // 写
                        byteBuffer.flip();// 反转
                        socketChannel.write(byteBuffer);
                    } else {
                        Thread.sleep(100);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (CollectionUtils.isNotEmpty(socketChannelList)) {
                socketChannelList.forEach(socketChannel -> {
                    try {
                        socketChannel.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                });
            }
        }
    }
}
