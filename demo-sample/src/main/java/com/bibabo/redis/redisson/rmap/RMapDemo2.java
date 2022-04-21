package com.bibabo.redis.redisson.rmap;

import com.bibabo.redis.redisson.common.RedissonCommonUtil;
import org.redisson.api.RMap;
import org.redisson.api.RedissonClient;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * @author fukuixiang
 * @date 2020/7/17
 * @time 11:42
 * @description
 */
public class RMapDemo2 {

    public static void main(String[] args) {

        RedissonClient redissonClient = RedissonCommonUtil.start();
        RMap<String,Object> rMap = redissonClient.getMap("TEST-MAP-1");
        System.out.println(rMap.get("handOverId") + "-----" + rMap.get("orderCnt"));

        Set<Map.Entry<String, Object>> entrySet = rMap.entrySet();
        Iterator<Map.Entry<String, Object>> iterator = entrySet.iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, Object> entry = iterator.next();
            System.out.println("key:" + entry.getKey() + "----" + "val:" + entry.getValue());
        }

        redissonClient.shutdown();
    }

}
