package com.bibabo.realtime.task.core.sink;

import com.bibabo.realtime.task.conf.BaseSinkConfigs;
import org.apache.flink.streaming.api.scala.DataStream;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 20:59
 * @Description
 */
public class CustomDebugSink implements Sink {

    private BaseSinkConfigs config;

    public CustomDebugSink(BaseSinkConfigs config) {
        this.config = config;
    }

    @Override
    public void write(DataStream<String> stream, String streamName) {
        stream.print("Debug: ");
    }
}
