package com.bibabo.elastic;

import org.apache.http.HttpHost;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;

/**
 * @author fukuixiang
 * @date 2022/6/14
 * @time 17:14
 * @description
 */
public class EsConnection {

    private static RestHighLevelClient restHighLevelClient;

    static {
        //初始化ES操作客户端
        final CredentialsProvider credentialsProvider = new BasicCredentialsProvider();
        credentialsProvider.setCredentials(AuthScope.ANY, new UsernamePasswordCredentials("elastic", "123456"));  //es账号密码
        restHighLevelClient = new RestHighLevelClient(
                RestClient.builder(new HttpHost("39.107.156.177", 9200))
                        .setHttpClientConfigCallback(httpClientBuilder -> {
                            httpClientBuilder.disableAuthCaching();
                            return httpClientBuilder.setDefaultCredentialsProvider(credentialsProvider);
                        })
        );
    }

    public static final RestHighLevelClient getClient() {
        return restHighLevelClient;
    }
}
