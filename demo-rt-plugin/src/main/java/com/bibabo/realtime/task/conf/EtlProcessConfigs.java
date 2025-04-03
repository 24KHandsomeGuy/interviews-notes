package com.bibabo.realtime.task.conf;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 10:24
 * @Description
 */
@Getter
@Setter
public class EtlProcessConfigs implements Serializable {

    private boolean etlEnable;

    private boolean debugRuleEnable;

    private Long etlRuleInterval;

    private String etlRuleStr;
}
