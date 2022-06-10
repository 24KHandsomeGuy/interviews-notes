package com.bibabo.schedule.spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author fukuixiang
 * @date 2022/6/10
 * @time 18:26
 * @description
 */
@Configuration
public class ScheduleAnnotionTestConfiguration {

    @Bean
    public ScheduleAnnotionTest scheduleAnnotionTest() {
        return new ScheduleAnnotionTest();
    }
}
