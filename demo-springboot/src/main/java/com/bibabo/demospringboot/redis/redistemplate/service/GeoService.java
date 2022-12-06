package com.bibabo.demospringboot.redis.redistemplate.service;

import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.geo.Circle;
import org.springframework.data.geo.Distance;
import org.springframework.data.geo.GeoResults;
import org.springframework.data.geo.Point;
import org.springframework.data.redis.connection.RedisGeoCommands;
import org.springframework.data.redis.core.GeoOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/6 16:15
 * @Description:
 */
@Service
public class GeoService {

    private static final String KEY = "softdrinks";

    @Autowired
    private RedisTemplate redisTemplate;

    @SneakyThrows
    public Flux<Point> getPointByName(List<String> nameList) {
        GeoOperations geoOperations = redisTemplate.opsForGeo();
        List<Point> resultList = new ArrayList<>();
        nameList.forEach(name -> resultList.addAll(geoOperations.position(KEY, name)));
        return Flux.fromIterable(resultList);
    }

    public Mono<GeoResults> getNearByXY(Point point, Distance distance) {
        Circle circle = new Circle(point, distance);
        RedisGeoCommands.GeoRadiusCommandArgs args = RedisGeoCommands.GeoRadiusCommandArgs.
                newGeoRadiusArgs().
                includeDistance(). // 包含距离
                includeCoordinates(). // 包含坐标
                sortAscending(). // 排序 还可选sortDescending()
                limit(5); // 获取前多少个
        GeoResults geoResults = redisTemplate.opsForGeo().radius(KEY, circle, args);
        return Mono.just(geoResults);
    }
}
