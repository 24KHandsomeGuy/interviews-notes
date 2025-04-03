package com.bibabo.GOF23.observer.event2.listener;

import com.bibabo.GOF23.observer.event2.BizEvent;
import com.bibabo.GOF23.observer.event2.BizEventListener;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/7/17 17:20
 * @Description
 */
public class CouponsHandlerListener implements BizEventListener {

    @Override
    public boolean decide(BizEvent event) {
        return true;
    }

    @Override
    public void onEvent(BizEvent event) {
        System.out.println("优惠券处理器:十折优惠券已发放");
    }
}
