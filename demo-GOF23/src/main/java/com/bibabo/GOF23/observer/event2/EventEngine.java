package com.bibabo.GOF23.observer.event2;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/7/17 17:06
 * @Description
 */
public interface EventEngine {

    /**
     * 发送事件
     *
     * @param event 事件
     */
    void publishEvent(BizEvent event);
}
