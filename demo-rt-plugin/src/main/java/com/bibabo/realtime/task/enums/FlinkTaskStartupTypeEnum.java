package com.bibabo.realtime.task.enums;

import lombok.Getter;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 09:36
 * @Description
 */
@Getter
public enum FlinkTaskStartupTypeEnum {

    FIRST_STARTUP(1, "直接启动"),
    MYSQL_GTID(2, "MySQL位点启动"),
    KAFKA_OFFSET(3, "Kafka位点启动"),
    TIMESTAMP(4, "时间戳"),
    CHECK_POINT(5, "checkpoint启动"),
    SAVE_POINT(6, "savepoint启动"),
    ;

    private final int type;

    private final String desc;

    FlinkTaskStartupTypeEnum(int type, String desc) {
        this.type = type;
        this.desc = desc;
    }
}
