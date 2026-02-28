package com.bibabo.flink.wordcount;

import org.apache.flink.api.common.functions.FlatMapFunction;
import org.apache.flink.api.java.functions.KeySelector;
import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.datastream.KeyedStream;
import org.apache.flink.streaming.api.datastream.SingleOutputStreamOperator;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.util.Collector;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2025/4/4 16:18
 * @Description 有界流
 */
public class WordCountStreamDemo {

    public static void main(String[] args) throws Exception {

        StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // 2. 从文件中读取数据
        DataStreamSource<String> datasource =
                env.readTextFile("/Users/fukuixiang/work/IT/Code/Damon/interviews-notes/demo-flink1.17/text/word.txt");

        SingleOutputStreamOperator<Tuple2<String, Integer>> wordAndOne = datasource.flatMap(new FlatMapFunction<String, Tuple2<String, Integer>>() {
            @Override
            public void flatMap(String value, Collector<Tuple2<String, Integer>> out) throws Exception {
                // 3.1 按空格切分单词
                String[] words = value.split(" ");
                for (String word : words) {
                    // 3.2 切分后的单词，记录出现的次数
                    Tuple2<String, Integer> wordTuple = Tuple2.of(word, 1);
                    // 3.3 使用collector向下游发送数据
                    out.collect(wordTuple);
                }
            }
        });

        // 4. 按照word分组
        KeyedStream<Tuple2<String, Integer>, String> keyedStream = wordAndOne.keyBy(new KeySelector<Tuple2<String, Integer>, String>() {
            @Override
            public String getKey(Tuple2<String, Integer> value) throws Exception {
                return value.f0;
            }
        });

        // 5. 各分组内聚合
        SingleOutputStreamOperator<Tuple2<String, Integer>> sum = keyedStream.sum(1);

        // 6. 输出
        sum.print();

        env.execute();
    }
}
