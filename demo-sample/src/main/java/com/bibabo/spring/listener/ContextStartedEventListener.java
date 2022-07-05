package com.bibabo.spring.listener;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.ContextStartedEvent;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/25 19:57
 * @Description:
 */
@Component
public class ContextStartedEventListener implements ApplicationListener<ContextRefreshedEvent> {
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        System.out.println("ContextStartedEventListener监听到Spring容器已刷新" + event);
    }
}
