package com.bibabo.realtime.task.utils;

import com.jcraft.jsch.MAC;
import org.apache.kafka.clients.admin.AdminClient;
import org.apache.kafka.clients.admin.DescribeTopicsResult;
import org.apache.kafka.clients.admin.TopicDescription;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.KafkaFuture;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ExecutionException;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/29 11:23
 * @Description
 */
public class KafkaUtils {

    private final static Logger log = LoggerFactory.getLogger(KafkaUtils.class);

    private static KafkaProducer<String, String> createProducer(Properties prop) {
        return new KafkaProducer<>(prop);
    }

    public static void sendMessage(String topic, String jsonMessage, Properties prop) {
        KafkaProducer<String, String> producer = createProducer(prop);
        producer.send(new ProducerRecord<>(topic, jsonMessage));
        producer.close();
    }

    public static void sendMessage(Properties prop, String topic, String... jsonMessages) {
        KafkaProducer<String, String> producer = createProducer(prop);
        for (String jsonMessage : jsonMessages) {
            producer.send(new ProducerRecord<>(topic, jsonMessage));
        }
        producer.close();
    }

    public static int getPartitionNum(String topic, Properties properties) {

        AdminClient adminClient = AdminClient.create(properties);
        int partitionNum = 0;
        // 获取主题描述信息
        try {
            DescribeTopicsResult describeTopicsResult = adminClient.describeTopics(Collections.singleton(topic));
            Map<String, KafkaFuture<TopicDescription>> topicMap = describeTopicsResult.values();
            TopicDescription topicDescription = topicMap.get(topic).get();
            partitionNum = topicDescription.partitions().size();
        } catch (ExecutionException | InterruptedException e) {
            throw new RuntimeException(e);
        }
        adminClient.close();
        return partitionNum;
    }
}
