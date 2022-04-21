package com.bibabo.redis.redisson.rset;

import org.redisson.Redisson;
import org.redisson.api.RSet;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.redisson.config.SentinelServersConfig;
import redis.redisson.RSkuMain;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author fukuixiang
 * @date 2020/6/10
 * @time 14:04
 * @description
 */
public class RsetDemo {

    public static void main(String[] args) {

        Config config = new Config();
        List<String> url = Arrays.asList("redis://redis.uat.chunbo.com:26380");
        SentinelServersConfig serversConfig = config.useSentinelServers()
                .addSentinelAddress(url.toArray(new String[0]))
                .setMasterName("mymaster")
                .setDatabase(8)
                .setMasterConnectionPoolSize(1)
                .setMasterConnectionMinimumIdleSize(1)
                .setSlaveConnectionPoolSize(1)
                .setSlaveConnectionMinimumIdleSize(1);
        RedissonClient redissonClient = Redisson.create(config);

        RSet<RSkuMain> rSkuMainRSet = redissonClient.getSet("NOREPACKAGE_POPULARGOODS_SKUIDS2");
        RSkuMain rSkuMain = new RSkuMain((long) 10000,"10000",1);
        RSkuMain rSkuMain2 = new RSkuMain((long) 10000,"10000",1);
        RSkuMain rSkuMain3 = new RSkuMain((long) 10000,"10000",0);
        rSkuMainRSet.add(rSkuMain);
        rSkuMainRSet.add(rSkuMain2);
        rSkuMainRSet.add(rSkuMain3);

        rSkuMainRSet.readAll();
        /*while () {

        }*/
        redissonClient.shutdown();
    }


}

class SetDemo {

    public static void main(String[] args) {
        Set<RSkuMain> rSkuMainSet = new HashSet<RSkuMain>();
        RSkuMain rSkuMain = new RSkuMain((long) 10000,"10000",1);
        RSkuMain rSkuMain2 = new RSkuMain((long) 10000,"10000",2);
        rSkuMainSet.add(rSkuMain);
        rSkuMainSet.add(rSkuMain2);
        System.out.println(rSkuMainSet.size());
    }

}