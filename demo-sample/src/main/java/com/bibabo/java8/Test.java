package com.bibabo.java8;


import com.alibaba.fastjson.JSONObject;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author fukuixiang
 * @date 2022/3/4
 * @time 9:55
 * @description
 */
public class Test {

    public static void main(String[] args) throws IOException {
        List<DecorationLayoutEntity> decorationLayoutConfigs = new ArrayList();
        decorationLayoutConfigs.add(new DecorationLayoutEntity(2, 4));
        decorationLayoutConfigs.add(new DecorationLayoutEntity(1, 3));
        decorationLayoutConfigs.add(new DecorationLayoutEntity(1, 2));

        Map<Integer, List<DecorationLayoutEntity>> sortLayoutMap = new TreeMap<>(
                decorationLayoutConfigs.stream()
                        .collect(Collectors.groupingBy(DecorationLayoutEntity::getSort))
        );
        System.out.println(JSONObject.toJSON(sortLayoutMap));

        Map<Integer, Set<DecorationLayoutEntity>> result = new TreeMap<>();
        for(Map.Entry<Integer, List<DecorationLayoutEntity>> entry : sortLayoutMap.entrySet()){
            result.put(entry.getKey(), new HashSet<>(entry.getValue()));
        }
        System.out.println(JSONObject.toJSON(result));
    }

    @AllArgsConstructor
    @Data
    public static class DecorationLayoutEntity {
        int sort;
        int value;
    }
}
