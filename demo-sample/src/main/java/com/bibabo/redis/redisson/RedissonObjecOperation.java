package com.bibabo.redis.redisson;

import org.redisson.Redisson;
import org.redisson.api.RBucket;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.redisson.config.SentinelServersConfig;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2020/6/4
 * @time 10:22
 * @description
 */
public class RedissonObjecOperation {

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
         RBucket<SkuMain> rBucket = redissonClient.getBucket("PGSKUID_2");
        SkuMain skuMain =  rBucket.get();

         if (skuMain == null) {
             skuMain = new SkuMain();
             skuMain.setUpcNo("1111");
             skuMain.setSkuId(2222);
             rBucket.set(skuMain,600, TimeUnit.SECONDS);
         }
        skuMain =  rBucket.get();
        redissonClient.shutdown();
    }

}
