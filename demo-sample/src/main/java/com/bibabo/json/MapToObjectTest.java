package com.bibabo.json;

import com.alibaba.fastjson.JSONObject;
import lombok.ToString;

import java.util.HashMap;
import java.util.Map;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/14 09:49
 * @Description
 */
public class MapToObjectTest {

    public static void main(String[] args) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", "fkx");
        map.put("age", 18);
        map.put("id", 1);
        User user = JSONObject.parseObject(JSONObject.toJSONString(map), User.class);
        System.out.println(user);
    }


    @ToString
    private static final class User {
        private String name;
        private int age;
        private int id;

    }
}
