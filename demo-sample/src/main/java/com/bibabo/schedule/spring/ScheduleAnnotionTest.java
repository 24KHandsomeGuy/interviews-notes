package com.bibabo.schedule.spring;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.io.IOException;
import java.util.Date;

/**
 * @author fukuixiang
 * @date 2022/6/10
 * @time 18:21
 * @description
 */
public class ScheduleAnnotionTest {

    @Scheduled(cron = "0/1 * * * * ?")
    public void reportCurrentTime() {
        System.out.println("Time is " + new Date());
    }

    public static void main(String[] args) throws InterruptedException, IOException {

        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(ScheduleAnnotionTestConfiguration.class, EnableScheduling.class);

        System.in.read();
    }
}
