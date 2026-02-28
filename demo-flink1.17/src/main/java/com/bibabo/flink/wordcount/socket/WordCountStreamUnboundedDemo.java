package com.bibabo.flink.wordcount.socket;

import org.apache.flink.api.common.functions.FlatMapFunction;
import org.apache.flink.api.common.typeinfo.Types;
import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2025/4/4 16:18
 * @Description 无界流
 */
public class WordCountStreamUnboundedDemo {

    public static void main(String[] args) throws Exception {

        StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // 2. 从文件中读取数据
        DataStreamSource<String> datasource = env.socketTextStream("localhost", 8080);

        datasource.flatMap((FlatMapFunction<String, Tuple2<String, Integer>>) (value, out) -> {
                    // 3.1 按空格切分单词
                    String[] words = value.split(" ");
                    for (String word : words) {
                        // 3.2 切分后的单词，记录出现的次数
                        Tuple2<String, Integer> wordTuple = Tuple2.of(word, 1);
                        // 3.3 使用collector向下游发送数据
                        out.collect(wordTuple);
                    }
                })
                .returns(Types.TUPLE(Types.STRING, Types.INT))
                .keyBy(value -> value.f0)
                .sum(1)
                .print();

        env.execute();
    }
}
