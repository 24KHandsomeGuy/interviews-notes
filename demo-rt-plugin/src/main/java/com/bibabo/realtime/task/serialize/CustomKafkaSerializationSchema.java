package com.bibabo.realtime.task.serialize;

import com.alibaba.fastjson.JSONObject;
import org.apache.flink.api.common.serialization.SerializationSchema;
import org.apache.flink.connector.kafka.sink.KafkaRecordSerializationSchema;
import org.apache.kafka.clients.producer.ProducerRecord;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/27 14:34
 * @Description
 */
public class CustomKafkaSerializationSchema implements KafkaRecordSerializationSchema<String> {

    private final String topic;

    public CustomKafkaSerializationSchema(String topic) {
        this.topic = topic;
    }

    @Override
    public void open(SerializationSchema.InitializationContext context, KafkaSinkContext sinkContext) throws Exception {
        KafkaRecordSerializationSchema.super.open(context, sinkContext);
    }

    @Override
    public ProducerRecord<byte[], byte[]> serialize(String element, KafkaSinkContext kafkaSinkContext, Long timestamp) {
        // 如果element中存在topic, 则使用，否则用默认topic
        JSONObject jsonElement = JSONObject.parseObject(element);
        String topic = this.topic == null ? jsonElement.getString("targetTopic") : this.topic;

        String uniqueKey = jsonElement.getString("uniqueKey");
        byte[] uniqueKeyBytes = uniqueKey == null ? null : uniqueKey.getBytes();

        return new ProducerRecord<>(topic, uniqueKeyBytes, element.getBytes());
    }
}
