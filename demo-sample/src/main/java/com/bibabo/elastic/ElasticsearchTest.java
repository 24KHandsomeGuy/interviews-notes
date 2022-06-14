package com.bibabo.elastic;

import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.client.indices.GetIndexResponse;

import java.io.IOException;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/13 23:43
 * @Description:
 */
public class ElasticsearchTest {

    public static void main(String[] args) throws IOException, InterruptedException {
        RestHighLevelClient restHighLevelClient = EsConnection.getClient();

        CreateIndexRequest request = new CreateIndexRequest("user");
        CreateIndexResponse response = restHighLevelClient.indices().create(request, RequestOptions.DEFAULT);

        //相应状态
        final boolean b = response.isAcknowledged();

        if (b) {
            System.out.println("响应创建成功");
        } else {
            System.out.println("响应创建失败");
        }


        Thread.sleep(1000 * 5);
        //获取索引
        GetIndexRequest requestGet = new GetIndexRequest("user");
        GetIndexResponse responseGet = restHighLevelClient.indices().get(requestGet, RequestOptions.DEFAULT);

        System.out.println(responseGet.getAliases());
        System.out.println(responseGet.getMappings());
        System.out.println(responseGet.getSettings());
        restHighLevelClient.close();
    }
}
