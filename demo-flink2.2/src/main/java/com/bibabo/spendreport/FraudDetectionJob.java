package com.bibabo.spendreport;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.configuration.RestOptions;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.walkthrough.common.entity.Alert;
import org.apache.flink.walkthrough.common.entity.Transaction;
import org.apache.flink.walkthrough.common.sink.AlertSink;
import org.apache.flink.walkthrough.common.source.TransactionSource;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2026/2/28 14:03 @Description
 */
public class FraudDetectionJob {

  static void main() throws Exception {

    Configuration configuration = new Configuration();
    configuration.set(RestOptions.PORT, 8081);
    StreamExecutionEnvironment env =
        StreamExecutionEnvironment.createLocalEnvironmentWithWebUI(configuration);

    DataStream<Transaction> transactions =
        env.addSource(new TransactionSource()).setParallelism(1).name("transactions");
    transactions.print("Source:::");

    DataStream<Alert> alerts =
        transactions
            .keyBy(Transaction::getAccountId)
            .process(new FraudDetector())
            .name("fraud-detector");

    alerts.addSink(new AlertSink()).name("send-alerts");

    env.execute("Fraud Detection");
  }
}
