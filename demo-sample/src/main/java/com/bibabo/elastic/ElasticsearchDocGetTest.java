package com.bibabo.elastic;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.action.get.GetResponse;
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
public class ElasticsearchDocGetTest {

    public static void main(String[] args) throws Exception {

        // 创建ES客户端
        RestHighLevelClient client = EsConnection.getClient();

        //创建请求对象
        GetRequest request = new GetRequest().index("user").id("1");
        //客户端发送请求，获取响应对象
        GetResponse response = client.get(request, RequestOptions.DEFAULT);
        System.out.println("index:" + response.getIndex());
        System.out.println("type:" + response.getType());
        System.out.println("id:" + response.getId());
        System.out.println("source:" + response.getSourceAsString());

        // 关闭ES客户端
        client.close();
    }


}
