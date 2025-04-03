package com.bibabo.realtime.task.conf;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.apache.kafka.common.TopicPartition;

import java.util.Map;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 09:27
 * @Description
 */
@Getter
@Setter
public class BaseSourceConfigs {

    private String type;

    private String outputTagFields;// 用于分流的字段名称，逗号分割

    private Integer sourceParallelism;

    private Integer encryptFlag;//EncryptTypeEnum

    private String encryptKey;// 加密的key 有默认值 可以不传

    /**
     * @see FlinkTaskStartupTypeEnum
     */
    private Integer startupType;

    private Long timestamp;

    // mysql
    private String host;

    private Integer port;

    private String databaseList;

    private String tableList;

    private String userName;

    private String password;

    private Boolean includeSchema;

    private String jsonType;

    private String gtidSet;

    // kafka
    private String brokers;

    private String topic;

    private String groupId;

    private String saslJaasConfigUsername;

    private String saslJaasConfigPassword;

    private String securityProtocol;

    private String saslMechanism;

    @JsonIgnore
    private Map<TopicPartition, Long> topicPartitionOffsetMap;
}
