package com.bibabo.io.java.reactor.multisingle;

import com.bibabo.io.java.reactor.singlesingle.Acceptor;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.util.Iterator;
import java.util.Set;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/19 21:00
 * @Description: reactor模型：基于NIO多路复用机制提出的一个高性能IO设计模式。职能的拆分，将反应堆reactor（selector）、acctepor、handler分离开来
 * 核心：Acceptor、Handler
 * 多线程单Reactor模型
 * accetor单线程处理，handler多线程处理
 */
public class MultiSingleReactor implements Runnable {

    Selector selector;
    ServerSocketChannel serverSocketChannel;

    public MultiSingleReactor(int port) throws IOException {
        selector = Selector.open();
        serverSocketChannel = ServerSocketChannel.open();
        serverSocketChannel.configureBlocking(false);// 如果采用多用复用模式，必须设置为非阻塞
        serverSocketChannel.socket().bind(new InetSocketAddress(port));
        // 附件
        serverSocketChannel.register(selector, SelectionKey.OP_ACCEPT, new MultiAcceptor(selector, serverSocketChannel));
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
        MultiSingleReactor singleSingleReactor = new MultiSingleReactor(9090);
        new Thread(singleSingleReactor).start();

    }
}
