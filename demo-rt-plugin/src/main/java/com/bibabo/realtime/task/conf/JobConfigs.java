package com.bibabo.realtime.task.conf;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/25 11:30
 * @Description
 */
public class JobConfigs {

    private String id;

    private String configJdbcUrl;

    private String configJdbcName;

    private String configPassword;

    private Integer configJdbcEncryptFlag;// 加密标记

    private String configJdbcEncryptKey;// 加密使用的key，用于解密，有默认值

    private JobKafkaConfig jobKafkaConfig;

    private List<FlowConfigs> flows;

    private CheckpointConfigs checkpoint;
}
