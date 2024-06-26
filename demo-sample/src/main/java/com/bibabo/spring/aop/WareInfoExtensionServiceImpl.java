package com.bibabo.spring.aop;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/17 13:59
 * @Description
 */
@ConsumerAspect(2000)
public class WareInfoExtensionServiceImpl {

    public void getWareInfo() {
        System.out.println("WareInfoExtensionServiceImpl.test");
    }

    @ConsumerAspect(1000)
    public void getWareInfo2() {
        System.out.println("WareInfoExtensionServiceImpl.test2");
    }
}
