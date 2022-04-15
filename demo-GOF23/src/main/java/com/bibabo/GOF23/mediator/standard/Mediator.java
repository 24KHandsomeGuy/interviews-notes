package com.bibabo.GOF23.mediator.standard;

import java.util.LinkedList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2020/9/7
 * @time 9:53
 * @description 中介者 调停者 接口 中介者模式适用于 如电话本，中介，聊天群
 */
abstract class Mediator {

    /**
     * 同事集合
     */
    protected List<Colleague> colleagueList = new LinkedList<Colleague>();

    /**
     * 注册
     */
    abstract void register(Colleague colleague);

    /**
     * 转发
     */
    abstract void relay(String name, String addr);

}
