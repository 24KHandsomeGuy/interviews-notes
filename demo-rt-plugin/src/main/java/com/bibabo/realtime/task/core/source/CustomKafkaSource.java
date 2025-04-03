package com.bibabo.realtime.task.core.source;

import com.alibaba.fastjson.JSONObject;
import com.bibabo.realtime.task.conf.BaseSourceConfigs;
import com.bibabo.realtime.task.enums.EncryptTypeEnum;
import com.bibabo.realtime.task.enums.FlinkTaskStartupTypeEnum;
import com.bibabo.realtime.task.utils.CryptUtil;
import com.bibabo.realtime.task.utils.KafkaUtils;
import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.connector.kafka.source.enumerator.initializer.OffsetsInitializer;
import org.apache.flink.streaming.api.scala.DataStream;
import org.apache.flink.streaming.api.scala.StreamExecutionEnvironment;
import org.apache.kafka.clients.admin.AdminClientConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Properties;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/27 14:49
 * @Description
 */
public class CustomKafkaSource implements Source {

    private static final String defaultGroupId = "didsp-rt-default-groupid-001";

    private static final Logger logger = LoggerFactory.getLogger(CustomKafkaSource.class);

    private final DataStream<String> streamSource;

    public CustomKafkaSource(StreamExecutionEnvironment env, BaseSourceConfigs config) {

        logger.info("kafka config:{}", JSONObject.toJSONString(config));
        Properties properties = new Properties();
        if (config.getSaslJaasConfigUsername() != null) {
            boolean encFlag = config.getEncryptFlag() != null && config.getEncryptFlag() == EncryptTypeEnum.DEFAULT.getValue();
            String username = encFlag
                    ? CryptUtil.decrypt(config.getSaslJaasConfigUsername(), config.getEncryptKey())
                    : config.getSaslJaasConfigUsername();
            String password = encFlag
                    ? CryptUtil.decrypt(config.getSaslJaasConfigPassword(), config.getEncryptKey())
                    : config.getSaslJaasConfigPassword();

            String configStr = "org.apache.kafka.common.security.plain.PlainLoginModule required\nusername=\""
                    + username + "\"\npassword=\""
                    + password + "\";";
            properties.put("sasl.jaas.config", configStr);
            properties.put("security.protocol", config.getSecurityProtocol());
            properties.put("sasl.mechanism", config.getSaslMechanism());
        }

        OffsetsInitializer offsetsInitializer = OffsetsInitializer.latest();
        if (config.getStartupType() == FlinkTaskStartupTypeEnum.KAFKA_OFFSET.getType() && config.getTopicPartitionOffsetMap() != null) {
            offsetsInitializer = OffsetsInitializer.offsets(config.getTopicPartitionOffsetMap());
        } else if (config.getStartupType() == FlinkTaskStartupTypeEnum.TIMESTAMP.getType() && config.getTimestamp() != null) {
            offsetsInitializer = OffsetsInitializer.timestamp(config.getTimestamp());
        }

        KafkaSource<String> source = KafkaSource.<String>builder()
                .setBootstrapServers(config.getBrokers())
                .setTopics(config.getTopic())
                .setGroupId(config.getGroupId() == null ? defaultGroupId : config.getGroupId())
                .setStartingOffsets(offsetsInitializer)
                .setValueOnlyDeserializer(new SimpleStringSchema())
                .setProperties(properties)
                //.set
                .build();


        // 如果没有设置并发度则使用分区数
        properties.put(AdminClientConfig.BOOTSTRAP_SERVERS_CONFIG, config.getBrokers());
        int partitionNum = KafkaUtils.getPartitionNum(config.getTopic(), properties);

        int sourceParallelism = 1;
        if (config.getSourceParallelism() > 0) {
            sourceParallelism = config.getSourceParallelism();
        } else if (config.getSourceParallelism() > partitionNum) {
            sourceParallelism = partitionNum;
        }

        this.streamSource = env.fromSource(source, WatermarkStrategy.noWatermarks(), "Kafka Source", null)
                .setParallelism(sourceParallelism);
    }

    @Override
    public DataStream<String> stream() {
        return streamSource;
    }
}
