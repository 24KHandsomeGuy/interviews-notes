package com.bibabo.realtime.task.serialize;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ververica.cdc.debezium.DebeziumDeserializationSchema;
import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.util.Collector;
import org.apache.kafka.connect.data.Struct;
import org.apache.kafka.connect.source.SourceRecord;

import java.util.HashSet;
import java.util.Set;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/29 10:21
 * @Description 不写了 无非就是一种json格式处理
 */
public class CanalDebeziumDeserializeSchema implements DebeziumDeserializationSchema<String> {

    private final String destination;

    private final String targetTopic;

    private final ObjectMapper mapper;

    public CanalDebeziumDeserializeSchema(String destination, String targetTopic) {
        this.destination = destination;
        this.targetTopic = targetTopic;
        this.mapper = new ObjectMapper();
    }

    @Override
    public void deserialize(SourceRecord sourceRecord, Collector<String> collector) throws Exception {
        /**
         * 主键信息
         */
        Struct key = (Struct) sourceRecord.key();
        Set<String> keyFieldSet = new HashSet<>();
        String uniqueKey = null;

    }

    @Override
    public TypeInformation<String> getProducedType() {
        return null;
    }


}
