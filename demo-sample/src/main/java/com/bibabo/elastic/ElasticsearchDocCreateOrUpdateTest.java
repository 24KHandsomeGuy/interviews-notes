package com.bibabo.elastic;

import com.fasterxml.jackson.databind.ObjectMapper;
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
public class ElasticsearchDocCreateOrUpdateTest {

    public static void main(String[] args) throws Exception {

        // 创建ES客户端
        RestHighLevelClient client = EsConnection.getClient();

        //新增文档，创建请求对象
        IndexRequest indexRequest = new IndexRequest();
        // 设置索引及唯一性标识
        indexRequest.index("user").id("1");
        //设置索引及唯一性标识
        DocumentModel documentModel = new DocumentModel();
        documentModel.setUid(UUID.randomUUID().toString());
        documentModel.setUser("Damon");
        documentModel.setMessage("test es doc");

        // 向ES插入数据，必须将数据转换位JSON格式
        ObjectMapper mapper = new ObjectMapper();
        String userJson = mapper.writeValueAsString(documentModel);
        indexRequest.source(userJson, XContentType.JSON);
        //发送请求，获取响应对象
        IndexResponse indexResponse = client.index(indexRequest, RequestOptions.DEFAULT);
        System.out.println("新增文档的状态：" + indexResponse.getResult());

        // 关闭ES客户端
        client.close();
    }

}
