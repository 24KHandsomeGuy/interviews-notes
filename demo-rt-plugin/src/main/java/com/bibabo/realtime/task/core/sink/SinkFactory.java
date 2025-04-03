package com.bibabo.realtime.task.core.sink;

import com.bibabo.realtime.task.conf.BaseSinkConfigs;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/27 14:46
 * @Description
 */
public abstract class SinkFactory {

    public static Sink newKafkaSink(BaseSinkConfigs config) {
        return new CustomDebugSink(config);
    }

    public static Sink newDebugSink(BaseSinkConfigs config) {
        return new CustomDebugSink(config);
    }
}
