package com.bibabo.redis.redisson.rbuket;

import com.bibabo.redis.redisson.common.RedissonCommonUtil;
import org.redisson.api.RBucket;
import org.redisson.api.RedissonClient;

/**
 * @author fukuixiang
 * @date 2020/7/17
 * @time 18:40
 * @description
 */
public class RBuketDemo {

    public static void main(String[] args) {

        RedissonClient redissonClient = RedissonCommonUtil.start();
        RBucket<ROrderHandOver> rBucket = redissonClient.getBucket("TEST-BUCKET-1");
        ROrderHandOver rOrderHandOver = rBucket.get();
        if (null == rOrderHandOver) {
            rOrderHandOver = new ROrderHandOver();
            rOrderHandOver.setId(1);
        } else {
            rOrderHandOver.setId(rOrderHandOver.getId() + 1);
        }
        rBucket.set(rOrderHandOver);

        redissonClient.shutdown();

    }


}
