package com.bibabo.GOF23.adapter.dubbo;

/**
 * @author fukuixiang
 * @date 2021/2/5
 * @time 17:33
 * @description 协议的适配器
 * 把Protocol 1234 接口的功能适配到Protocol里来
 */
public class ProtocolImpl implements Protocol {

    @Override
    public void bind(int rule) {
        if (rule == 1) {
            new Protocol1Impl().bind1();
        } else if (rule == 2) {
            new Protocol2Impl().bind2();
        } else if (rule == 3) {
            new Protocol3Impl().bind3();
        } else if (rule == 4) {
            new Protocol4Impl().bind4();
        }
    }
}
