package com.bibabo.realtime.task.enums;

import lombok.Getter;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/27 16:18
 * @Description
 */
@Getter
public enum DataFormatTypeEnum {

    JSON("json"),
    CANAL_JSON("canal_json"),
    DEBEZIUM_JSON("debezium_json"),;

    private final String name;

    DataFormatTypeEnum(String name) {
        this.name = name;
    }

    public static DataFormatTypeEnum get(String name) {

        for (DataFormatTypeEnum typeEnum : DataFormatTypeEnum.values()) {
            if (typeEnum.getName().equalsIgnoreCase(name)) {
                return typeEnum;
            }
        }
        return DataFormatTypeEnum.JSON;
    }

}
