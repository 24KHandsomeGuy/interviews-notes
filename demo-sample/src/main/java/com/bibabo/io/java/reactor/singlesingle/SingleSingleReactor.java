package com.bibabo.io.java.reactor.singlesingle;

import com.bibabo.io.java.nio.NioServerSocketMultiplex;

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
 * @Date: 2022/6/19 21:00
 * @Description: reactor模型：基于NIO多路复用机制提出的一个高性能IO设计模式。职能的拆分，将反应堆reactor（selector）、acctepor、handler分离开来
 * 核心：Acceptor、Handler
 * 单线程单Reactor模型
 * 缺点：单个线程处理，如果存在某个连接的任务处理时间很久，会影响到其他连接
 */
public class SingleSingleReactor implements Runnable {

    Selector selector;
    ServerSocketChannel serverSocketChannel;

    public SingleSingleReactor(int port) throws IOException {
        selector = Selector.open();
        serverSocketChannel = ServerSocketChannel.open();
        serverSocketChannel.configureBlocking(false);// 如果采用多用复用模式，必须设置为非阻塞
        serverSocketChannel.socket().bind(new InetSocketAddress(port));
        // 附件
        serverSocketChannel.register(selector, SelectionKey.OP_ACCEPT, new Acceptor(selector, serverSocketChannel));
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
        Runnable runnable = (Runnable) selectionKey.attachment();
        // accept read write
        runnable.run();
    }

    public static void main(String[] args) throws IOException {
        SingleSingleReactor singleSingleReactor = new SingleSingleReactor(9090);
        new Thread(singleSingleReactor).start();

    }
}
