package com.bibabo.realtime.task.serialize;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.common.base.Joiner;
import com.ververica.cdc.debezium.DebeziumDeserializationSchema;
import org.apache.flink.api.common.typeinfo.BasicTypeInfo;
import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.util.Collector;
import org.apache.kafka.connect.data.Field;
import org.apache.kafka.connect.data.Schema;
import org.apache.kafka.connect.data.Struct;
import org.apache.kafka.connect.json.JsonConverter;
import org.apache.kafka.connect.json.JsonConverterConfig;
import org.apache.kafka.connect.source.SourceRecord;
import org.apache.kafka.connect.storage.ConverterConfig;
import org.apache.kafka.connect.storage.ConverterType;

import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/27 16:36
 * @Description A JSON format implementation of {@link DebeziumDeserializationSchema} which deserializes the
 * received {@link SourceRecord} to JSON string.
 * 复制的：
 * @see com.ververica.cdc.debezium.JsonDebeziumDeserializationSchema
 */
public class CustomDebeziumDeserializeSchema implements DebeziumDeserializationSchema<String> {

    private static final long serialVersionUUID = 1L;

    private transient JsonConverter jsonConverter;

    private ObjectMapper mapper;

    /**
     * Configuration whether to enable {@link org.apache.kafka.connect.json.JsonConverterConfig#SCHEMAS_ENABLE_CONFIG} to include
     * schema in messages.
     */
    private final Boolean includeSchema;

    /**
     * The custom configurations for {@link JsonConverter}.
     */
    private Map<String, Object> customConverterConfigs;

    public CustomDebeziumDeserializeSchema() {
        this(false);
    }

    public CustomDebeziumDeserializeSchema(Boolean includeSchema) {
        this.includeSchema = includeSchema;
    }

    public CustomDebeziumDeserializeSchema(Boolean includeSchema, Map<String, Object> customConverterConfigs) {
        this.includeSchema = includeSchema;
        this.customConverterConfigs = customConverterConfigs;
    }

    @Override
    public void deserialize(SourceRecord sourceRecord, Collector<String> collector) throws Exception {

        if (jsonConverter == null) {
            initializeJsonConverter();
        }
        if (mapper == null) {
            mapper = new ObjectMapper();
        }
        byte[] bytes = jsonConverter.fromConnectData(sourceRecord.topic(), sourceRecord.valueSchema(), sourceRecord.value());
        JsonNode jsonNode = mapper.readTree(new String(bytes));
        String uniqueKey = getTableUniqueKey((Struct) sourceRecord.key());
        ((ObjectNode) jsonNode).put("uniqueKey", uniqueKey);
        collector.collect(mapper.writeValueAsString(jsonNode));
    }

    private String getTableUniqueKey(Struct key) {
        if (key == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        SortedMap<Integer, String> uk = new TreeMap<>();
        Schema keySchema = key.schema();
        for (Field field : keySchema.fields()) {
            // todo 先简单跑起来
            //Object fieldValue = Coverutil;
            //uk.put(field.index(). fieldValue == null ? null : String.valueOf(fieldValue));
        }

        sb.append(Joiner.on("|").join(uk.values()));

        return sb.toString();
    }

    private void initializeJsonConverter() {
        jsonConverter = new JsonConverter();
        final HashMap<String, Object> configs = new HashMap<>();
        configs.put(ConverterConfig.TYPE_CONFIG, ConverterType.VALUE.getName());
        configs.put(JsonConverterConfig.SCHEMAS_ENABLE_CONFIG, includeSchema);
        if (customConverterConfigs != null) {
            configs.putAll(customConverterConfigs);
        }
        jsonConverter.configure(configs);
    }

    @Override
    public TypeInformation<String> getProducedType() {
        return BasicTypeInfo.STRING_TYPE_INFO;
    }
}
