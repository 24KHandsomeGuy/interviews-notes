package com.bibabo.realtime.task.core.sink;

import com.bibabo.realtime.task.conf.BaseSinkConfigs;
import com.bibabo.realtime.task.enums.EncryptTypeEnum;
import com.bibabo.realtime.task.serialize.CustomKafkaSerializationSchema;
import com.bibabo.realtime.task.utils.CryptUtil;
import org.apache.flink.connector.base.DeliveryGuarantee;
import org.apache.flink.connector.kafka.sink.KafkaSink;
import org.apache.flink.streaming.api.scala.DataStream;
import org.apache.kafka.clients.producer.ProducerConfig;

import java.util.Objects;
import java.util.Properties;
import java.util.UUID;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 21:03
 * @Description
 */
public class CustomKafkaSink implements Sink {

    // kafka
    private final String brokers;

    private final String saslJaasConfigUsername;

    private final String saslJaasConfigPassword;

    private final String securityProtocol;

    private final String saslMechanism;

    private final String topic;

    private final Integer sinkParallelism;

    public CustomKafkaSink(BaseSinkConfigs config) {
        boolean encFlag = config.getEncryptFlag() != null && config.getEncryptFlag() == EncryptTypeEnum.DEFAULT.getValue();
        this.brokers = config.getBrokers();
        this.saslJaasConfigUsername = encFlag
                ? CryptUtil.decrypt(config.getSaslJaasConfigUsername(), config.getEncryptKey())
                : config.getSaslJaasConfigUsername();
        this.saslJaasConfigPassword = encFlag
                ? CryptUtil.decrypt(config.getSaslJaasConfigPassword(), config.getEncryptKey())
                : config.getSaslJaasConfigPassword();
        this.securityProtocol = config.getSecurityProtocol();
        this.saslMechanism = config.getSaslMechanism();
        this.sinkParallelism = config.getSinkParallelism();
        this.topic = config.getTopic();
    }

    @Override
    public void write(DataStream<String> stream, String streamName) {
        stream.filter(Objects::nonNull).setParallelism(sinkParallelism).sinkTo(createSink()).setParallelism(sinkParallelism).name(streamName);
    }

    private KafkaSink<String> createSink() {
        Properties properties = new Properties();
        properties.put(ProducerConfig.CLIENT_ID_CONFIG, "didsp-rt-producer-" + UUID.randomUUID());
        if (saslJaasConfigUsername != null) {
            String config = "org.apache.kafka.common.security.plain.PlainLoginModule required\nusername=\""
                    + saslJaasConfigUsername + "\"\npassword=\""
                    + saslJaasConfigPassword + "\";";
            properties.put("sasl.jaas.config", config);
            properties.put("security.protocol", securityProtocol);
            properties.put("sasl.mechanism", saslMechanism);
        }

        return KafkaSink.<String>builder()
                .setBootstrapServers(brokers)
                .setRecordSerializer(new CustomKafkaSerializationSchema(topic))
                .setKafkaProducerConfig(properties)
                .setDeliverGuarantee(DeliveryGuarantee.AT_LEAST_ONCE)
                .build();
    }
}
