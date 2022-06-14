package com.bibabo.elastic;

import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.Fuzziness;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.sort.SortOrder;

/**
 * @Author: Damon Fu
 * @Date: 2022/6/13 23:43
 * @Description:
 */
public class ElasticsearchDocSearchTest {

    public static void main(String[] args) throws Exception {

        // 创建ES客户端
        RestHighLevelClient client = EsConnection.getClient();

        // 创建搜索请求对象
        SearchRequest request = new SearchRequest();
        request.indices("user");
        // 构建查询的请求体
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        // searchSourceBuilder.query(QueryBuilders.matchAllQuery());
        searchSourceBuilder.query(QueryBuilders.fuzzyQuery("user", "dam").fuzziness(Fuzziness.TWO));
        /*String[] excludes = {};
        // 包含字段
        String[] includes = {"Damo"};
        searchSourceBuilder.fetchSource(includes, excludes);*/
        request.source(searchSourceBuilder.from(0).size(1000)/*.sort("uid", SortOrder.ASC)*/);


        // 查询匹配
        SearchResponse response = client.search(request, RequestOptions.DEFAULT);
        SearchHits hits = response.getHits();

        System.out.println("耗时：" + response.getTook());
        System.out.println("命中条数：" + hits.getTotalHits());
        for (SearchHit hit : hits) {
            System.out.println("id:" + hit.getId() + ",source:" + hit.getSourceAsString());
        }
        // 关闭ES客户端
        client.close();
    }

}
