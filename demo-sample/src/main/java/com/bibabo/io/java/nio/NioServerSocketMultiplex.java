package com.bibabo.io.java.nio;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.Iterator;
import java.util.Set;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/19 20:28
 * @Description: NIO 多路复用
 * 1.等待连接可以设置为非阻塞的
 * 2.等待IO准备就绪可以设置为非阻塞的
 * 基于事件驱动
 */
public class NioServerSocketMultiplex implements Runnable {

    Selector selector;
    ServerSocketChannel serverSocketChannel;

    public NioServerSocketMultiplex(int port) throws IOException {
        selector = Selector.open();
        serverSocketChannel = ServerSocketChannel.open();
        serverSocketChannel.configureBlocking(false);// 如果采用多用复用模式，必须设置为非阻塞
        serverSocketChannel.socket().bind(new InetSocketAddress(port));
        serverSocketChannel.register(selector, SelectionKey.OP_ACCEPT);
    }

    @Override
    public void run() {
        while (!Thread.currentThread().isInterrupted()) {
            try {
                selector.select();// 阻塞等待事件就绪
                Set<SelectionKey> selectionKeySet = selector.selectedKeys();
                for (Iterator<SelectionKey> iterator = selectionKeySet.iterator(); iterator.hasNext(); ) {
                    SelectionKey selectionKey = iterator.next();
                    dispatch(selectionKey);
                    iterator.remove();// 一定要移除掉
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void dispatch(SelectionKey selectionKey) throws IOException {
        // 是哪种事件
        if (selectionKey.isAcceptable()) {
            register(selectionKey);
        } else if (selectionKey.isReadable()) {
            read(selectionKey);
        } else if (selectionKey.isWritable()) {

        }
    }

    private void register(SelectionKey selectionKey) throws IOException {
        // 连接事件，注册到selector上的一定是ServerSocketChannel
        ServerSocketChannel serverSocketChannel = (ServerSocketChannel) selectionKey.channel();
        // 此时一定会拿到连接
        SocketChannel socketChannel = serverSocketChannel.accept();
        socketChannel.configureBlocking(false);
        socketChannel.register(selector, SelectionKey.OP_READ);
    }

    private void read(SelectionKey selectionKey) throws IOException {
        SocketChannel socketChannel = (SocketChannel) selectionKey.channel();
        ByteBuffer byteBuffer = ByteBuffer.allocate(1024);
        socketChannel.read(byteBuffer);
        System.out.println("Server receive msg :" + new String(byteBuffer.array()));
        //socketChannel.register(selector, SelectionKey.OP_WRITE);
    }

    public static void main(String[] args) throws IOException {
        NioServerSocketMultiplex serverSocketMultiplex = new NioServerSocketMultiplex(9090);
        new Thread(serverSocketMultiplex).start();

    }
}
