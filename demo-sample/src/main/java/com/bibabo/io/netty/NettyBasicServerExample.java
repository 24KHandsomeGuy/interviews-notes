package com.bibabo.io.netty;

import com.bibabo.io.java.nio.NioServerSocket;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/4 22:13
 * @Description:
 */
public class NettyBasicServerExample {

    public static void main(String[] args) throws InterruptedException {

        // 主线程组
        EventLoopGroup bossGroup = new NioEventLoopGroup();
        // 工作线程组
        EventLoopGroup workGroup = new NioEventLoopGroup(4);

        ServerBootstrap bootstrap = new ServerBootstrap();
        bootstrap.group(bossGroup, workGroup).channel(NioServerSocketChannel.class).childHandler(new ChannelInitializer<SocketChannel>() {
            @Override
            protected void initChannel(SocketChannel socketChannel) throws Exception {
                socketChannel.pipeline().addLast(new NormalMessageHandler());
            }
        });
        ChannelFuture channelFuture = bootstrap.bind(8080).sync();
        System.out.println("Netty server started success");
        channelFuture.channel().closeFuture().sync();

        bossGroup.shutdownGracefully();
        workGroup.shutdownGracefully();
    }
}
