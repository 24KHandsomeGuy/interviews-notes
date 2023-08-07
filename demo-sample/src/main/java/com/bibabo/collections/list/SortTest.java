package com.bibabo.collections.list;

import com.alibaba.fastjson.JSONObject;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class SortTest {

    public static void main(String[] args) {

        List<SortDemo> list = Arrays.asList(new SortDemo(1), new SortDemo(2),
                new SortDemo(2), new SortDemo(3), new SortDemo(100),
                new SortDemo(null), new SortDemo(null)).stream().sorted((o1, o2) -> {
            Integer sort1 = o1.getStatus();
            Integer sort2 = o2.getStatus();
            // 3 > 1 > 2 > null展示。券包状态。 1：未开始 | 2：已售罄 | 3：售卖中 | 4：已失效 | 5：已结束 | 6：超过购买限制
            if (sort1 == null) {
                sort1 = Integer.MAX_VALUE;
            }
            if (sort2 == null) {
                sort2 = Integer.MIN_VALUE;
            }
            if (sort1 == 3) {
                sort1 = 1;
            } else if (sort1 == 2) {
                sort1 = 3;
            } else if (sort1 == 1) {
                sort1 = 2;
            }
            if (sort2 == 3) {
                sort2 = 1;
            } else if (sort2 == 2) {
                sort2 = 3;
            } else if (sort2 == 1) {
                sort2 = 2;
            }
            return sort1 - sort2;
        }).collect(Collectors.toList());

        System.out.printf(JSONObject.toJSONString(list));
    }

    @Builder
    @AllArgsConstructor
    @Data
    private static class SortDemo {
        private Integer status;

    }
}
