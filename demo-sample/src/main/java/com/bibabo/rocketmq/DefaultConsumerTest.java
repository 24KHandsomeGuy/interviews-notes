package com.bibabo.rocketmq;

import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyContext;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.common.message.MessageExt;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author fukuixiang
 * @date 2020/9/29
 * @time 9:56
 * @description
 */
public class DefaultConsumerTest {

    private static Map<String, MessageListenerConcurrently> listenerMap = new ConcurrentHashMap<>();

    public static void main(String[] args) {

        Runnable r = () -> {

            DefaultMQPushConsumer defaultMQPushConsumer = new DefaultMQPushConsumer("group_1");

            defaultMQPushConsumer.setNamesrvAddr("10.254.128.130:9876");

            try {
                defaultMQPushConsumer.subscribe("test1","*");
                MessageListenerConcurrently listenerConcurrently = (arg0, arg1)  -> {
                    arg0.stream().forEach( item -> {System.out.println("test1：" +  new String(item.getBody()));});
                    return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
                };
                listenerMap.put("test1",listenerConcurrently);

                defaultMQPushConsumer.subscribe("test2","*");
                MessageListenerConcurrently listenerConcurrently2 = (arg0, arg1)  -> {
                    arg0.stream().forEach( item -> {System.out.println("test2：" +  new String(item.getBody()));});
                    return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
                };
                listenerMap.put("test2",listenerConcurrently2);
            } catch (MQClientException e) {
                e.printStackTrace();
            }

            defaultMQPushConsumer.registerMessageListener(new MyMessageListener());

            try {
                defaultMQPushConsumer.start();
            } catch (MQClientException e) {
                e.printStackTrace();
            }

        };
        new Thread(r).start();

        /*Runnable r2 = () -> {

            DefaultMQPushConsumer defaultMQPushConsumer = new DefaultMQPushConsumer("group_1");

            defaultMQPushConsumer.setNamesrvAddr("10.254.128.130:9876");



            try {
                defaultMQPushConsumer.subscribe("test1","*");
            } catch (MQClientException e) {
                e.printStackTrace();
            }

            defaultMQPushConsumer.registerMessageListener((MessageListenerConcurrently) (arg0, arg1)  -> {
                System.out.println(arg0);
                return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
            });

            try {
                defaultMQPushConsumer.start();
            } catch (MQClientException e) {
                e.printStackTrace();
            }

        };
        new Thread(r2).start();*/

        //System.in.read();
    }

    public static class MyMessageListener implements MessageListenerConcurrently {


        @Override
        public ConsumeConcurrentlyStatus consumeMessage(List<MessageExt> list, ConsumeConcurrentlyContext consumeConcurrentlyContext) {
             ConsumeConcurrentlyStatus status = null;
            /*list.stream().forEach(item -> {
                MessageListenerConcurrently messageListener = listenerMap.get(item.getTopic());
                status = messageListener.consumeMessage(list,consumeConcurrentlyContext);
            });*/
            MessageListenerConcurrently messageListener = listenerMap.get(list.get(0).getTopic());
            status = messageListener.consumeMessage(list,consumeConcurrentlyContext);
            return status;
        }
    }

}
