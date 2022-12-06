package com.bibabo.demospringboot.redis.redistemplate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.BitFieldSubCommands;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import reactor.core.publisher.Mono;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/6 14:26
 * @Description:
 */
@Service
public class BitMapService {

    private static final String KEY_PREFIX = "USER_PUNCH_IN_RECORDS_";

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    public Mono<Map<Integer, Boolean>> getUserIsExists(long userId, int limit, int offset) {
        Map<Integer, Boolean> signedInMap = new HashMap<>();
        List<Long> bitfield = this.stringRedisTemplate
                .opsForValue()
                .bitField(KEY_PREFIX + userId, BitFieldSubCommands.create().get(BitFieldSubCommands.BitFieldType.unsigned(limit)).valueAt(offset));
        if (!CollectionUtils.isEmpty(bitfield)) {
            long signFlag = bitfield.get(0) == null ? 0 : bitfield.get(0);
            for (int i = limit; i > 0; i--) {
                signedInMap.put(i, signFlag >> 1 << 1 != signFlag);
                signFlag >>= 1;
            }
        }
        return Mono.justOrEmpty(signedInMap);
    }
}
