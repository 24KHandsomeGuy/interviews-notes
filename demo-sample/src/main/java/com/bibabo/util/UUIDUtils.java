package com.bibabo.util;

import java.util.UUID;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/8/23 16:42
 * @Description
 */
public abstract class UUIDUtils {

    public static String getTruncatedNTimesFromBackUUID(int ntimes) {
        String uuid = UUID.randomUUID().toString();
        for (int i = 0; i < ntimes; i++) {
            uuid = uuid.substring(0, uuid.lastIndexOf("-"));
        }
        return uuid.replaceAll("-", "");
    }
}
