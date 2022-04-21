package com.bibabo.redis.redisson;

import org.redisson.Redisson;
import org.redisson.api.RList;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.redisson.config.SentinelServersConfig;

import java.util.Arrays;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2020/6/4
 * @time 10:22
 * @description
 */
public class RedissonListOperation {

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
         RList<SkuMain> rList = redissonClient.getList("PGSKUID_22");
         /*List<SkuMain> skuMains = rList.readAll();
         if (skuMains.size() > 0) {
             //rList.expire()
         }*/
         SkuMain skuMain = new SkuMain();
         skuMain.setSkuId(222);
         skuMain.setUpcNo("333");
         skuMain.setSkuCode("111");
         rList.add(skuMain);
        //List<SkuMain> skuMains2 = rList.readAll();
        redissonClient.shutdown();
    }

}
