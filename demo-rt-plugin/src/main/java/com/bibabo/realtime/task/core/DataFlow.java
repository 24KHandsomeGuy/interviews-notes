package com.bibabo.realtime.task.core;

import com.bibabo.realtime.task.bean.RealtimeTaskPlanRule;
import com.bibabo.realtime.task.conf.BaseSinkConfigs;
import com.bibabo.realtime.task.conf.BaseSourceConfigs;
import com.bibabo.realtime.task.conf.EtlProcessConfigs;
import com.bibabo.realtime.task.conf.FlowConfigs;
import com.bibabo.realtime.task.core.sink.Sink;
import com.bibabo.realtime.task.core.source.Source;
import com.bibabo.realtime.task.core.source.SourceFactory;
import com.bibabo.realtime.task.enums.SourceTypeEnum;
import org.apache.flink.api.common.state.MapStateDescriptor;
import org.apache.flink.api.common.typeinfo.BasicTypeInfo;
import org.apache.flink.api.common.typeinfo.TypeHint;
import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.streaming.api.scala.StreamExecutionEnvironment;

import java.util.List;
import java.util.Map;

import static org.apache.flink.table.shaded.org.reflections.util.ConfigurationBuilder.build;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/29 10:37
 * @Description
 */
public class DataFlow {

    private Source source;

    private Map<String, Sink> sinks;// sink对象

    MapStateDescriptor<String, Map<String, RealtimeTaskPlanRule>> etlRules;

    private Map<String, String> outputTags;// 设置输出标签，用于分流

    private DataFlow(StreamExecutionEnvironment env, FlowConfigs config) {
        initialSource(env, config.getSource());
        initialRuleConfig(config.getEtlProcess());
        initalSinks(env, config.getSinks());
        build(env, config);
    }

    private void initalSinks(StreamExecutionEnvironment env, List<BaseSinkConfigs> sinks) {

    }

    /**
     * 初始化etl process
     *
     * @param etlProcess etl信息
     */
    private void initialRuleConfig(EtlProcessConfigs etlProcess) {
        // 判断配置中是否开启规则流
        if (etlProcess != null && etlProcess.isEtlEnable()) {
            etlRules = new MapStateDescriptor<>("etl_rules",
                    // key类型
                    BasicTypeInfo.STRING_TYPE_INFO,
                    // value类型
                    TypeInformation.of(new TypeHint<Map<String, RealtimeTaskPlanRule>>() {
                    }));
        }
    }

    private void initialSource(StreamExecutionEnvironment env, BaseSourceConfigs config) {
        SourceTypeEnum sourceType = SourceTypeEnum.get(config.getType());
        if (sourceType == null) {
            throw new IllegalArgumentException(String.format("%s is not supported", config.getType()));
        }

        switch (sourceType) {
            case MYSQL:
                // 如果是cdc，默认全程单并发
                config.setSourceParallelism(1);
                source = SourceFactory.newMysqlCdcSource(env, config);
                break;
            case KAFKA:
                int sourceParallelism = config.getSourceParallelism() == null ? env.getParallelism() : config.getSourceParallelism();
                config.setSourceParallelism(sourceParallelism);
                source = SourceFactory.newKafkaSource(env, config);
            default:
                throw new IllegalArgumentException(String.format("%s is not supported", config.getType()));
        }
    }

    public static void newFlow(StreamExecutionEnvironment env, FlowConfigs config) {
        new DataFlow(env, config);
    }
}
