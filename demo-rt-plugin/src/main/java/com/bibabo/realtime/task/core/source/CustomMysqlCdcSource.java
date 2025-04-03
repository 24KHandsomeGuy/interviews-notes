package com.bibabo.realtime.task.core.source;

import com.bibabo.realtime.task.conf.BaseSourceConfigs;
import com.bibabo.realtime.task.enums.DataFormatTypeEnum;
import com.bibabo.realtime.task.enums.EncryptTypeEnum;
import com.bibabo.realtime.task.enums.FlinkTaskStartupTypeEnum;
import com.bibabo.realtime.task.serialize.CanalDebeziumDeserializeSchema;
import com.bibabo.realtime.task.utils.CryptUtil;
import com.ververica.cdc.connectors.mysql.source.MySqlSource;
import com.ververica.cdc.connectors.mysql.table.StartupOptions;
import com.ververica.cdc.debezium.DebeziumDeserializationSchema;
import com.ververica.cdc.debezium.JsonDebeziumDeserializationSchema;
import org.apache.commons.lang.StringUtils;
import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.streaming.api.scala.DataStream;
import org.apache.flink.streaming.api.scala.StreamExecutionEnvironment;
import org.apache.kafka.connect.json.DecimalFormat;
import org.apache.kafka.connect.json.JsonConverterConfig;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/27 14:49
 * @Description
 */
public class CustomMysqlCdcSource implements Source {

    private final DataStream<String> streamSource;

    public CustomMysqlCdcSource(StreamExecutionEnvironment env,
                                BaseSourceConfigs config) {

        String user = config.getUserName();
        String password = config.getPassword();
        if (config.getEncryptFlag() != null && config.getEncryptFlag() == EncryptTypeEnum.DEFAULT.getValue()) {
            user = CryptUtil.decrypt(user, config.getEncryptKey());
            password = CryptUtil.decrypt(password, config.getEncryptKey());
        }

        // 关闭debezium读快照加锁，允许数据重复
        Properties properties = new Properties();
        properties.setProperty("snapshot.locking.mode", "none");

        // 数据转化的自定义参数
        Map<String, Object> customConverterConfigs = new HashMap<>();
        customConverterConfigs.put(JsonConverterConfig.DECIMAL_FORMAT_CONFIG, DecimalFormat.NUMERIC.name());

        StartupOptions startupOptions = StartupOptions.latest();
        // 支持多种启动方式
        if (config.getStartupType() == FlinkTaskStartupTypeEnum.MYSQL_GTID.getType() && StringUtils.isNotBlank(config.getGtidSet())) {
            startupOptions = StartupOptions.specificOffset(config.getGtidSet());
        } else if (config.getStartupType() == FlinkTaskStartupTypeEnum.TIMESTAMP.getType() && config.getTimestamp() != null) {
            startupOptions = StartupOptions.timestamp(config.getTimestamp());
        }

        DebeziumDeserializationSchema<String> debeziumDeserializationSchema = null;
        if (StringUtils.isBlank(config.getJsonType()) || DataFormatTypeEnum.DEBEZIUM_JSON.getName().equals(config.getJsonType())) {
            boolean includeSchemaFlag = config.getIncludeSchema() != null && config.getIncludeSchema();
            debeziumDeserializationSchema = new JsonDebeziumDeserializationSchema(includeSchemaFlag, customConverterConfigs);
        } else if (DataFormatTypeEnum.CANAL_JSON.getName().equals(config.getJsonType())) {
            debeziumDeserializationSchema = new CanalDebeziumDeserializeSchema("", "");
        }

        MySqlSource<String> mySqlSource = MySqlSource.<String>builder()
                .hostname(config.getHost())
                .port(config.getPort())
                .databaseList(config.getDatabaseList() == null ? ".*" : config.getDatabaseList())
                .tableList(config.getTableList() == null ? ".*" : config.getTableList())
                .username(user)
                .password(password)
                .deserializer(debeziumDeserializationSchema)
                .startupOptions(startupOptions)
                .debeziumProperties(properties)
                //.customContext(JSONObject.toJSONString(RtTaskContext.getContext()))
                .build();
        streamSource = env.fromSource(mySqlSource, WatermarkStrategy.noWatermarks(), "MySQL Source", null);
        streamSource.setParallelism(config.getSourceParallelism());
    }

    @Override
    public DataStream<String> stream() {
        return streamSource;
    }
}
