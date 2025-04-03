package com.bibabo.realtime.task.enums;

import lombok.Getter;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/29 11:11
 * @Description
 */
@Getter
public enum SourceTypeEnum {

    MYSQL("mysql"),
    KAFKA("kafka"),;

    private final String name;

    SourceTypeEnum(String name) {
        this.name = name;
    }

    public static SourceTypeEnum get(String name) {
        for (SourceTypeEnum value : SourceTypeEnum.values()) {
            if (value.name.equals(name)) {
                return value;
            }
        }
        return null;
    }
}
