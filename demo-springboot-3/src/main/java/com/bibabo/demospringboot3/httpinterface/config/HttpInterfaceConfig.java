package com.bibabo.demospringboot3.httpinterface.config;

import com.bibabo.demospringboot3.httpinterface.service.CustomerApiCaller;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.support.WebClientAdapter;
import org.springframework.web.service.invoker.HttpServiceProxyFactory;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 11:45
 * @Description:
 */
@Configuration
public class HttpInterfaceConfig {

    @Value("${customer.baseurl}")
    private String customerBaseUrl;

    @Bean
    WebClient webClient() {
        return WebClient.builder()
                //添加全局默认请求头
                .defaultHeader("source", "http-interface")
                /*//给请求添加过滤器，添加自定义的认证头
                .filter((request, next) -> {
                    ClientRequest filtered = ClientRequest.from(request)
                            .header("Authorization", tokenHolder.getToken())
                            .build();
                    return next.exchange(filtered);
                })*/
                .baseUrl(customerBaseUrl).build();
    }

    @Bean
    CustomerApiCaller customerApiCaller(WebClient client) {
        HttpServiceProxyFactory factory = HttpServiceProxyFactory.builder(WebClientAdapter.forClient(client)).build();
        return factory.createClient(CustomerApiCaller.class);
    }
}
