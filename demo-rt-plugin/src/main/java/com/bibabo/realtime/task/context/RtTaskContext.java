package com.bibabo.realtime.task.context;

import com.bibabo.realtime.task.conf.JobKafkaConfig;
import com.bibabo.realtime.task.conf.JobMysqlConfig;
import lombok.Getter;
import lombok.Setter;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 20:54
 * @Description
 */
@Getter
@Setter
public class RtTaskContext {

    private RtTaskContext() {
    }

    private static final RtTaskContext rtTaskContext = new RtTaskContext();

    public static RtTaskContext getContext() {
        return rtTaskContext;
    }

    private String id;

    private JobMysqlConfig jobMysqlConfig;

    private JobKafkaConfig jobKafkaConfig;
}
