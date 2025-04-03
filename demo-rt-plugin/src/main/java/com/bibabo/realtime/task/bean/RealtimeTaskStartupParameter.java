package com.bibabo.realtime.task.bean;

import lombok.Getter;
import lombok.Setter;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 19:22
 * @Description
 */
@Getter
@Setter
public class RealtimeTaskStartupParameter {

    private Long refRealtimeTaskId;

    private Byte startupType;

    private String startupParam;
}
