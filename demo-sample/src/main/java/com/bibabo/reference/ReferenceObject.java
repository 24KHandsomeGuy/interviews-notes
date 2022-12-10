package com.bibabo.reference;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 17:25
 * @Description:
 */
public class ReferenceObject {

    @Override
    protected void finalize() throws Throwable {
        System.out.println("ReferenceObject is being garbage collected");
    }
}
