package com.bibabo.realtime.task.core.sink;

import org.apache.flink.streaming.api.scala.DataStream;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 20:59
 * @Description
 */
public interface Sink {

    void write(DataStream<String> stream, String streamName);
}
