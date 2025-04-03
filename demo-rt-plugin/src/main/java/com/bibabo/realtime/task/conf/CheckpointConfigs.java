package com.bibabo.realtime.task.conf;

import lombok.extern.slf4j.Slf4j;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/25 11:47
 * @Description
 */
@Slf4j
public class CheckpointConfigs {

    private boolean enable = false;

    private String mode = "exactly";

    private long interval = 10 * 60;

    private long timeout = 10 * 60;

    private String path;
}
