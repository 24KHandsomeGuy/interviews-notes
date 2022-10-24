package com.bibabo.demo;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Damon Fu
 * @Date: 2022/8/31 10:27
 * @Description:
 */
public class ChannelConfig {

    public String desc;

    public int order;

    @Override
    public String toString() {
        return "ChannelConfig{" +
                "desc='" + desc + '\'' +
                ", order=" + order +
                '}';
    }

    public static void main(String[] args) {

        ChannelConfig config1 = new ChannelConfig();
        config1.order = 1;
        //config1.desc = "aaa";

        ChannelConfig config2 = new ChannelConfig();
        config2.order = 2;

        List<ChannelConfig> list = new ArrayList<>();
        list.add(config1);
        list.add(config2);

        // 负数o1排在前面、正数o2排在后面
        // 对于排序器来说，就是按照你的返回值，小数在前，大数在后，升序排列
        list.sort((o1, o2) -> {
            if (o1.desc != null && o2.desc == null) {
                return -1;
            }
            if (o1.desc == null && o2.desc != null) {
                return 1;
            }
            return o1.order - o2.order;
        });

        list.forEach(System.out::println);
    }
}
