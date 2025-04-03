package com.bibabo.realtime.task.enums;

import lombok.Getter;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 09:31
 * @Description
 */
@Getter
public enum EncryptTypeEnum {

    NONE(0, "none"),
        DEFAULT(1, "default"),;

    private final int value;

    private final String desc;

    EncryptTypeEnum(int value, String desc) {
        this.value = value;
        this.desc = desc;
    }
}
