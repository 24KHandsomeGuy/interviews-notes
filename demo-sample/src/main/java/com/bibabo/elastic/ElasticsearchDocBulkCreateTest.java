package com.bibabo.elastic;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;

import java.util.UUID;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/13 23:43
 * @Description:
 */
public class ElasticsearchDocBulkCreateTest {

    public static void main(String[] args) throws Exception {

        // 创建ES客户端
        RestHighLevelClient client = EsConnection.getClient();

        // 创建批量新增请求对象
        BulkRequest bulkRequest = new BulkRequest();

        for (int i = 0;i < 10000; i ++) {
            if (i % 100 == 0) {
                bulkRequest.add(new IndexRequest().index("user").id(i + "").source(XContentType.JSON, "uid", UUID.randomUUID().toString(), "user", "Damon", "message", "test es doc dam"));
            } else {
                bulkRequest.add(new IndexRequest().index("user").id(i + "").source(XContentType.JSON, "uid", UUID.randomUUID().toString(), "user", "fukuixiang", "message", "test es doc dam"));
            }
        }

        BulkResponse bulkResponse = client.bulk(bulkRequest, RequestOptions.DEFAULT);
        System.out.println("批量插，Took: " + bulkResponse.getTook());
        System.out.println("批量插入，Items: " + bulkResponse.getItems());

        // 关闭ES客户端
        client.close();
    }


}
