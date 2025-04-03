package com.bibabo.realtime.task.conf;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 10:26
 * @Description
 */
@Getter
@Setter
public class BaseSinkConfigs implements Serializable {

    private Long id;

    private String type;

    private String outputTag;

    private Integer sinkParallelism;

    private String dataFormatType;

    private Integer encryptFlag;

    private String encryptKey;

    private List<RealtimePlanFieldMapping> fieldMappingList;

    // kafka
    private String brokers;

    private String saslJaasConfigUsername;

    private String saslJaasConfigPassword;

    private String securityProtocol;

    private String saslMechanism;

    private String topic;
}
