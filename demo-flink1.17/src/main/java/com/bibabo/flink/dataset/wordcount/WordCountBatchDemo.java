package com.bibabo.flink.dataset.wordcount;

import org.apache.flink.api.common.functions.FlatMapFunction;
import org.apache.flink.api.java.ExecutionEnvironment;
import org.apache.flink.api.java.operators.AggregateOperator;
import org.apache.flink.api.java.operators.DataSource;
import org.apache.flink.api.java.operators.FlatMapOperator;
import org.apache.flink.api.java.operators.UnsortedGrouping;
import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.util.Collector;

import java.nio.charset.Charset;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/10/8 08:54
 * @Description
 */
public class WordCountBatchDemo {

    public static void main(String[] args) throws Exception {

        // 1. 创建执行环境
        ExecutionEnvironment env = ExecutionEnvironment.getExecutionEnvironment();

        // 2. 从文件中读取数据
        DataSource<String> datasource =
                env.readTextFile("/Users/fukuixiang/work/IT/Code/Damon/interviews-notes/demo-flink1.17/text/word.txt");

        // 3. 按行切分、转换（word，1）
        FlatMapOperator<String, Tuple2<String, Integer>> wordWithOne = datasource.flatMap(new FlatMapFunction<String, Tuple2<String, Integer>>() {
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
        UnsortedGrouping<Tuple2<String, Integer>> wordWithOneGrouping = wordWithOne.groupBy(0);

        // 5. 各分组内聚合
        AggregateOperator<Tuple2<String, Integer>> sum = wordWithOneGrouping.sum(1);

        // 6. 输出
        sum.print();
    }
}
