package com.bibabo.realtime.task.conf;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/25 11:43
 * @Description
 */
@Getter
@Setter
public class FlowConfigs {

    private String flowId;

    private String configJdbcUrl;

    private String configJdbcName;

    private String configPassword;

    private BaseSourceConfigs source;

    private EtlProcessConfigs etlProcess;

    private List<BaseSinkConfigs> sinks;
}
