package com.bibabo.io.java.reactor.multimulti;

import lombok.SneakyThrows;

import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.SocketChannel;
import java.nio.charset.StandardCharsets;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/20 23:06
 * @Description:
 */
public class AsyncHandler implements Runnable {

    SocketChannel socketChannel;

    private SelectionKey sk;

    ByteBuffer inputBuffer = ByteBuffer.allocate(1024);
    ByteBuffer outputBuffer = ByteBuffer.allocate(1024);

    StringBuilder sb = new StringBuilder();

    public AsyncHandler(SocketChannel socketChannel) {
        this.socketChannel = socketChannel;
    }

    @SneakyThrows
    @Override
    public void run() {
        if (sk.isReadable()) {
            read();
        } else if (sk.isWritable()) {
            write();
        }
    }

    private void read() throws IOException {
        inputBuffer.clear();
        int n = socketChannel.read(inputBuffer);
        if (inputBufferComplete(n)) {
            System.out.println(Thread.currentThread().getName() + "Server收到客户端请求消息：" + sb.toString());
            outputBuffer.put(sb.toString().getBytes(StandardCharsets.UTF_8));
            this.sk.interestOps(SelectionKey.OP_WRITE);
        }
    }

    private boolean inputBufferComplete(int bytes) throws EOFException {
        if (bytes > 0) {
            inputBuffer.flip();
            while (inputBuffer.hasRemaining()) {
                byte ch = inputBuffer.get();// 得到输入的字符
                if (ch == 3) {// ctrl + c
                    throw new EOFException();
                } else if (ch == '\r' || ch == '\n') {
                    return true;
                }else {
                    sb.append((char) ch);
                }
            }
        } else if (bytes == 1) {
            throw new EOFException();
        }
        return false;
    }

    private void write() throws IOException {
        int write = -1;
        outputBuffer.flip();
        if (outputBuffer.hasRemaining()) {
            write = socketChannel.write(outputBuffer);// 把收到的消息写回客户端
        }
        outputBuffer.clear();
        sb.delete(0, sb.length());
        if (write <= 0) {
            this.sk.channel().close();
        } else {
            socketChannel.write(ByteBuffer.wrap("\r\nreactor>".getBytes()));
            this.sk.interestOps(SelectionKey.OP_READ);
        }
    }

    public SocketChannel getSocketChannel() {
        return socketChannel;
    }

    public void setSocketChannel(SocketChannel socketChannel) {
        this.socketChannel = socketChannel;
    }

    public SelectionKey getSk() {
        return sk;
    }

    public void setSk(SelectionKey sk) {
        this.sk = sk;
    }
}
