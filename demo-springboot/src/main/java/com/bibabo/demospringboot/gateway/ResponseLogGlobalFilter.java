/*
package com.bibabo.demospringboot.gateway;

import lombok.extern.slf4j.Slf4j;
import org.reactivestreams.Publisher;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.core.io.buffer.DataBufferFactory;
import org.springframework.core.io.buffer.DataBufferUtils;
import org.springframework.core.io.buffer.DefaultDataBufferFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.http.server.reactive.ServerHttpResponseDecorator;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;

*/
/**
 * @Author: FuKuiXiang
 * @Date: 2023/3/31 15:23
 * @Description:
 *//*

@Slf4j
@Component
public class ResponseLogGlobalFilter implements GlobalFilter, Ordered {

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        try {
            ServerHttpResponse originalResponse = exchange.getResponse();
            DataBufferFactory bufferFactory = originalResponse.bufferFactory();
            HttpStatus statusCode = originalResponse.getStatusCode();
            if (statusCode == HttpStatus.OK || statusCode == HttpStatus.TOO_MANY_REQUESTS) {
                ServerHttpResponseDecorator decoratedResponse = new ServerHttpResponseDecorator(originalResponse) {
                    @Override
                    public Mono<Void> writeWith(Publisher<? extends DataBuffer> body) {
                        Flux<? extends DataBuffer> fluxBody = Flux.from(body);
                        return super.writeWith(fluxBody.buffer().map(dataBuffer -> {
                            DataBufferFactory dataBufferFactory = new DefaultDataBufferFactory();
                            DataBuffer join = dataBufferFactory.join(dataBuffer);
                            byte[] content = new byte[join.readableByteCount()];
                            join.read(content);
                            DataBufferUtils.release(join);
                            ServerHttpRequest request = exchange.getRequest();
                            log.info("Response, URL:{}, Method:{}, headers:{}, response:{}", request.getURI().getPath(), request.getMethod(), exchange.getResponse().getHeaders(), new String(content, StandardCharsets.UTF_8));
                            return bufferFactory.wrap(content);
                        }));
                    }
                };
                return chain.filter(exchange.mutate().response(decoratedResponse).build());
            } else {
                log.info("Response, statusCode:{}", statusCode);
            }
            return chain.filter(exchange);
        } catch (Exception e) {
            log.error("Response log exception." + e, e);
            return chain.filter(exchange);
        }
    }


    @Override
    public int getOrder() {
        return Ordered.HIGHEST_PRECEDENCE;
    }
}
*/
