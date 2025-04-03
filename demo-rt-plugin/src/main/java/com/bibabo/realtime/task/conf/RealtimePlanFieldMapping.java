package com.bibabo.realtime.task.conf;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 18:54
 * @Description
 */
@Getter
@Setter
public class RealtimePlanFieldMapping implements Serializable {

    private Long id;

    private String sourceFieldName;

    private String sourceFieldNameCn;

    private String sourceFieldType;

    private String sourceFieldIsPk;

    private String sourceFieldComment;

    private String sourceFieldCanBeNull;

    private String targetFieldName;

    private String targetFieldNameCn;

    private String targetFieldType;

    private String targetFieldComment;

    private String targetFieldIsPk;

    private String targetFieldCanBeNull;

    private Boolean isEnabled;

    private Boolean partitionFlag;


}
