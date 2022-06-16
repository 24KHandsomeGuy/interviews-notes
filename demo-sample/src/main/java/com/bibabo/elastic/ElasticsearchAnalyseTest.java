package com.bibabo.elastic;

import org.elasticsearch.action.admin.indices.analyze.AnalyzeRequest;
import org.elasticsearch.action.admin.indices.analyze.AnalyzeResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.search.SearchHit;

import java.util.List;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/13 23:43
 * @Description:
 */
public class ElasticsearchAnalyseTest {

    public static void main(String[] args) throws Exception {

        // 创建ES客户端
        RestHighLevelClient client = EsConnection.getClient();

        // analyzer共6种
        AnalyzeRequest request = new AnalyzeRequest().analyzer("stop").text("h!ello wo2rld a b我是a中国人d");
        AnalyzeResponse response = client.indices().analyze(request, RequestOptions.DEFAULT);
        List<AnalyzeResponse.AnalyzeToken> tokens = response.getTokens();
        tokens.forEach(token -> {
            System.out.println(token.getTerm());
        });
        // 关闭ES客户端
        client.close();
    }

}
