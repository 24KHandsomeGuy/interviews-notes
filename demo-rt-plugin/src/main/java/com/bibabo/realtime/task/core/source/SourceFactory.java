package com.bibabo.realtime.task.core.source;

import com.bibabo.realtime.task.conf.BaseSourceConfigs;
import org.apache.flink.streaming.api.scala.StreamExecutionEnvironment;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/29 10:34
 * @Description
 */
public abstract class SourceFactory {

    public static Source newMysqlCdcSource(StreamExecutionEnvironment env, BaseSourceConfigs config) {
        return new CustomMysqlCdcSource(env, config);
    }

    public static Source newKafkaSource(StreamExecutionEnvironment env, BaseSourceConfigs config) {
        return new CustomKafkaSource(env, config);
    }
}
