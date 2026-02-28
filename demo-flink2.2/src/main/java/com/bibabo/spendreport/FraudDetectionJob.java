package com.bibabo.spendreport;

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

    StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

    DataStream<Transaction> transactions =
        env.addSource(new TransactionSource()).name("transactions");

    DataStream<Alert> alerts =
        transactions
            .keyBy(Transaction::getAccountId)
            .process(new FraudDetector())
            .name("fraud-detector");

    alerts.addSink(new AlertSink()).name("send-alerts");

    env.execute("Fraud Detection");
  }
}
