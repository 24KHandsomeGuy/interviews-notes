package com.bibabo.hutools;

import cn.hutool.core.net.NetUtil;
import cn.hutool.core.util.IdUtil;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/10/13 14:40
 * @Description
 */
public class SnowFlakeIdTest {

    public static void main(String[] args) {

        // System.out.println(IdUtil.getSnowflake(33).nextId());

        System.out.println(NetUtil.getLocalhostStr());

        System.out.println(NetUtil.getLocalhostStr().hashCode());

        System.out.println(NetUtil.ipv4ToLong(NetUtil.getLocalhostStr()));

        // System.out.println(IdUtil.getSnowflake(NetUtil.getLocalhostStr().hashCode()).nextId());

        // System.out.println(IdUtil.getSnowflake(NetUtil.ipv4ToLong(NetUtil.getLocalhostStr())));


    }
}
