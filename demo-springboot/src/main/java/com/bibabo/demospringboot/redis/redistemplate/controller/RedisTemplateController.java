package com.bibabo.demospringboot.redis.redistemplate.controller;

import com.bibabo.demospringboot.redis.redistemplate.service.BitMapService;
import com.bibabo.demospringboot.redis.redistemplate.service.GeoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.geo.Distance;
import org.springframework.data.geo.GeoResults;
import org.springframework.data.geo.Metrics;
import org.springframework.data.geo.Point;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/6 14:46
 * @Description:
 */
@RestController
public class RedisTemplateController {

    @Autowired
    private BitMapService bitMapService;

    @Autowired
    private GeoService geoService;

    @GetMapping("/redistemplate/users/{id}/{start}/{size}")
    public Mono<Map<Integer, Boolean>> getUserPunchInRecords(@PathVariable("id") long userId, @PathVariable("start") int offset, @PathVariable("size") int limit) {
        return bitMapService.getUserIsExists(userId, limit, offset);
    }

    @GetMapping("/redistemplate/geo/{names}")
    public Flux<Point> getPointByName(@PathVariable("names") String names) {
        List<String> nameList = Arrays.stream(names.split(",")).collect(Collectors.toList());
        return geoService.getPointByName(nameList);
    }

    @GetMapping("/redistemplate/geo/{longitude}/{latitude}/{distance}")
    public Mono<GeoResults> getNearByXY(@PathVariable("longitude") String longitude, @PathVariable("latitude") String latitude, @PathVariable("distance") int distance) {
        return geoService.getNearByXY(new Point(Double.parseDouble(longitude), Double.parseDouble(latitude)), new Distance(distance, Metrics.KILOMETERS));
    }
}
