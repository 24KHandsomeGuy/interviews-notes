package com.bibabo.io.java.reactor.multimulti;

import java.io.IOException;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.util.Iterator;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.ConcurrentLinkedQueue;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/20 22:08
 * @Description:
 * mainReactor subReactor
 */
public class Reactor implements Runnable {

    private final Selector selector;

    private ConcurrentLinkedQueue<AsyncHandler> events = new ConcurrentLinkedQueue<>();

    public Reactor() throws IOException {
        this.selector = Selector.open();
    }

    @Override
    public void run() {
        while (!Thread.interrupted()) {
            AsyncHandler handler;
            try {
                while ((handler=events.poll()) != null) {
                    handler.getSocketChannel().configureBlocking(false);
                    SelectionKey selectionKey = handler.getSocketChannel().register(selector, SelectionKey.OP_READ);
                    selectionKey.attach(handler);
                    handler.setSk(selectionKey);
                }
                selector.select();
                Set<SelectionKey> selectionKeys = selector.selectedKeys();
                for (Iterator<SelectionKey> iterator = selectionKeys.iterator(); iterator.hasNext(); ) {
                    SelectionKey selectionKey = iterator.next();
                    Runnable runnable = (Runnable) selectionKey.attachment();
                    Optional.ofNullable(runnable).ifPresent(Runnable::run);
                    iterator.remove();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public Selector getSelector() {
        return selector;
    }

    public void register(AsyncHandler asyncHandler) {
        events.offer(asyncHandler);
        selector.wakeup();
    }
}
