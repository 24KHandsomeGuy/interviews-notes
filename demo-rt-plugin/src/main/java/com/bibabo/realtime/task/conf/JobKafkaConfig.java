package com.bibabo.realtime.task.conf;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/25 11:41
 * @Description
 */
@AllArgsConstructor
@Getter
@Setter
public class JobKafkaConfig {

    private String brokers;

    private String userName;

    private String pwd;

    private String topic;

}
