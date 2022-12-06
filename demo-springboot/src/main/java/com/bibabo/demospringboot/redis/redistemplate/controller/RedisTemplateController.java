package com.bibabo.demospringboot.redis.redistemplate.controller;

import com.bibabo.demospringboot.redis.redistemplate.service.BitMapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

import java.util.Map;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/6 14:46
 * @Description:
 */
@RestController
public class RedisTemplateController {

    @Autowired
    private BitMapService bitMapService;

    @GetMapping("/redistemplate/users/{id}/{start}/{size}")
    public Mono<Map<Integer, Boolean>> getUserPunchInRecords(@PathVariable("id") long userId, @PathVariable("start") int offset, @PathVariable("size") int limit) {
        return bitMapService.getUserIsExists(userId, limit, offset);
    }
}
