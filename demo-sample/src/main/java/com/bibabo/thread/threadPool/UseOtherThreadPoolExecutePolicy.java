package com.bibabo.thread.threadPool;/*
package thread.threadPool;

import com.chunbo.order.util.SpringApplicationContextUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

*/
/**
 * @author fukuixiang
 * @date 2021/8/13
 * @time 17:04
 * @description 借助其他线程池执行策略
 * 如果spring中存在其他线程池，借助最大空闲个数线程池帮助执行当前任务
 *//*

public class UseOtherThreadPoolExecutePolicy implements RejectedExecutionHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(UseOtherThreadPoolExecutePolicy.class);
s
    @Override
    public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {

        LOGGER.info("拒绝策略：UseOtherThreadPoolExecutePolicy被执行，任务：{}", r);
        // 寻找Spring容器中的其他线程池
        Map<String, ThreadPoolExecutor> beansMap = SpringApplicationContextUtil.getContext().getBeansOfType(ThreadPoolExecutor.class);
        if (CollectionUtils.isEmpty(beansMap)) {
            LOGGER.info("拒绝策略：UseOtherThreadPoolExecutePolicy，寻找Spring容器中其他线程池数量为0");
            return;
        }
        Set<Map.Entry<String, ThreadPoolExecutor>> beansSet = beansMap.entrySet();
        int maxAvailableQty = 0;
        ThreadPoolExecutor maxAvailableQtyThreadPool = null;
        String maxAvailableQtyThreadPoolBeanName = "";
        for (Map.Entry<String, ThreadPoolExecutor> entry : beansSet) {
            ThreadPoolExecutor e = entry.getValue();
            if (executor.hashCode() == e.hashCode()) {
                continue;
            }
            int availableQty = e.getCorePoolSize() - e.getActiveCount() - e.getQueue().size();
            LOGGER.info("拒绝策略：UseOtherThreadPoolExecutePolicy，beanName：{}，剩余可用线程数为：{}", entry.getKey(), availableQty);
            if (availableQty > maxAvailableQty) {
                maxAvailableQty = availableQty;
                maxAvailableQtyThreadPool = e;
                maxAvailableQtyThreadPoolBeanName = entry.getKey();
            }
        }

        if (maxAvailableQtyThreadPool != null) {
            LOGGER.info("拒绝策略：UseOtherThreadPoolExecutePolicy，已找到可帮助执行的线程池：{}，最大可用个数为：{}", maxAvailableQtyThreadPoolBeanName, maxAvailableQtyThreadPool);
            maxAvailableQtyThreadPool.execute(r);
        }
    }
}
*/
