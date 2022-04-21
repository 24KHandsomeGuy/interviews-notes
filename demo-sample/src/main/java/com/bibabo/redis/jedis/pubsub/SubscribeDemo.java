package com.bibabo.redis.jedis.pubsub;

import redis.clients.jedis.Client;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisPubSub;
import redis.clients.jedis.JedisSentinelPool;

import java.util.HashSet;
import java.util.Set;

/**
 * @author fukuixiang
 * @date 2021/8/4
 * @time 15:01
 * @description
 */
public class SubscribeDemo {

    public static void main(String[] args) {

        // wms
        Set<String> sentinelNames = new HashSet<>();
        sentinelNames.add("redis.uat.chunbo.com:26380");
        // oms
        //sentinelNames.add("redis.uat.chunbo.com:26381");

        JedisSentinelPool pool = new JedisSentinelPool("mymaster", sentinelNames, new JedisPoolConfig(), 100000, null, 8);
        Jedis jedis = pool.getResource();
        jedis.subscribe(new JedisPubSub() {
            @Override
            public void onMessage(String channel, String message) {
                System.out.println("接收到消息：" + message);
            }
        }, "fukuixiang");

        jedis.close();
        pool.destroy();
    }

    public static class MyJedisPubSub extends JedisPubSub {

        @Override
        public void onMessage(String channel, String message) {
            System.out.println("onMessage:" + message);
        }

        @Override
        public void onPMessage(String pattern, String channel, String message) {
            System.out.println("onPMessage:" + message);
        }

        @Override
        public void onSubscribe(String channel, int subscribedChannels) {
            System.out.println("onSubscribe:" + subscribedChannels);
        }

        @Override
        public void onUnsubscribe(String channel, int subscribedChannels) {
            System.out.println("onUnsubscribe:" + subscribedChannels);
        }

        @Override
        public void onPUnsubscribe(String pattern, int subscribedChannels) {
            System.out.println("onPUnsubscribe:" + subscribedChannels);
        }

        @Override
        public void onPSubscribe(String pattern, int subscribedChannels) {
            System.out.println("onPSubscribe:" + subscribedChannels);
        }

        @Override
        public void unsubscribe() {
            super.unsubscribe();
        }

        @Override
        public void unsubscribe(String... channels) {
            super.unsubscribe(channels);
        }

        @Override
        public void subscribe(String... channels) {
            System.out.println("subscribe:" + channels);
        }

        @Override
        public void psubscribe(String... patterns) {
            System.out.println("psubscribe:" + patterns);
        }

        @Override
        public void punsubscribe() {
            super.punsubscribe();
        }

        @Override
        public void punsubscribe(String... patterns) {
            super.punsubscribe(patterns);
        }

        @Override
        public boolean isSubscribed() {
            return super.isSubscribed();
        }

        @Override
        public void proceedWithPatterns(Client client, String... patterns) {
            super.proceedWithPatterns(client, patterns);
        }

        @Override
        public void proceed(Client client, String... channels) {
            super.proceed(client, channels);
        }

        @Override
        public int getSubscribedChannels() {
            return super.getSubscribedChannels();
        }
    }
    /**
     * 监听到订阅模式接受到消息时的回调 (onPMessage)
     * 监听到订阅频道接受到消息时的回调 (onMessage )
     * 订阅频道时的回调( onSubscribe )
     * 取消订阅频道时的回调( onUnsubscribe )
     * 订阅频道模式时的回调 ( onPSubscribe )
     * 取消订阅模式时的回调( onPUnsubscribe )
     */
}
