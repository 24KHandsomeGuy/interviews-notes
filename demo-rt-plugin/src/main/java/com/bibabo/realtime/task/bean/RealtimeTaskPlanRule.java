package com.bibabo.realtime.task.bean;

import com.alibaba.fastjson.JSONObject;
import lombok.Getter;
import lombok.Setter;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 19:20
 * @Description
 */
@Getter
@Setter
public class RealtimeTaskPlanRule {

    private String databaseName;

    private String tableName;

    private JSONObject ruleConfigJson;
}
