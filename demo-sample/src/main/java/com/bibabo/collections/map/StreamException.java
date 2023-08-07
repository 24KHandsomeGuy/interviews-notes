package com.bibabo.collections.map;

import com.bibabo.java8.Test;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/8/1 19:39:14
 * @Description
 */
public class StreamException {

    public static void main(String[] args) throws IOException {
        List<Demo> demoList = new ArrayList<>();
        demoList.add(new Demo("1", "a"));
        demoList.add(new Demo("1", "b"));
        demoList.add(new Demo("1", "c"));
        Map<String, String> map = demoList.stream().collect(Collectors.toMap(Demo::getF, Demo::getV));
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    private static final class Demo implements Serializable {
        private String f;
        private String v;
    }
}
