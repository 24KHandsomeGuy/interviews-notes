package com.bibabo.realtime.task.core.source;

import org.apache.flink.streaming.api.scala.DataStream;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/27 14:50
 * @Description
 */
public interface Source {

    DataStream<String> stream();
}
