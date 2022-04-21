package com.bibabo.rocketmq;

import org.apache.rocketmq.client.exception.MQBrokerException;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.DefaultMQProducer;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.remoting.exception.RemotingException;

/**
 * @author fukuixiang
 * @date 2020/9/29
 * @time 11:10
 * @description
 */
public class DefaultProducerTest {

    public static void main(String[] args) {

        Runnable r = () -> {

            DefaultMQProducer defaultMQProducer = new DefaultMQProducer("group_1");
            defaultMQProducer.setNamesrvAddr("10.254.128.130:9876");

            try {
                defaultMQProducer.start();
            } catch (MQClientException e) {
                e.printStackTrace();
            }

            Message message = new Message("test1",new String("hello cunsumer").getBytes());
            Message message2 = new Message("test2",new String("hello cunsumer2").getBytes());

            SendResult sendResult1 = null;
            SendResult sendResult2 = null;
            try {
                sendResult1 = defaultMQProducer.send(message);
                sendResult2 = defaultMQProducer.send(message2);
            } catch (MQClientException e) {
                e.printStackTrace();
            } catch (RemotingException e) {
                e.printStackTrace();
            } catch (MQBrokerException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(sendResult1);
            System.out.println(sendResult2);

            //defaultMQProducer.shutdown();

        };
        new Thread(r).start();

        /*Runnable r2 = () -> {

            DefaultMQProducer defaultMQProducer = new DefaultMQProducer("group_1");
            defaultMQProducer.setNamesrvAddr("10.254.128.130:9876");

            try {
                defaultMQProducer.start();
            } catch (MQClientException e) {
                e.printStackTrace();
            }

            Message message = new Message("test2",new String("hello cunsumer").getBytes());

            SendResult sendResult = null;
            try {
                sendResult = defaultMQProducer.send(message);
            } catch (MQClientException e) {
                e.printStackTrace();
            } catch (RemotingException e) {
                e.printStackTrace();
            } catch (MQBrokerException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(sendResult);

            //defaultMQProducer.shutdown();

        };
        new Thread(r2).start();*/

    }

}
