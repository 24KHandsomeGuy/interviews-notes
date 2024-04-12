package com.bibabo.spring.aop;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/17 13:59
 * @Description
 */
@ConsumerAspect(4000)
public class WareInfoExtensionServiceImpl2 {

    public void getWareInfo() {
        System.out.println("WareInfoExtensionServiceImpl.test");
    }

    @ConsumerAspect(5000)
    public void getWareInfo2() {
        System.out.println("WareInfoExtensionServiceImpl.test2");
    }
}
